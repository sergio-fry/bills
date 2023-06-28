class Organization < ApplicationRecord
  validates :name, presence: true
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, class_name: 'User'
  has_many :incomes, through: :memberships
  has_many :expenses

  scope :with_member, ->(user) { joins(:memberships).where(memberships: { user_id: user.id }) }

  def member?(user) = memberships.exists?(member: user)
  def owner = members.find_by(memberships: { role: :owner })
  def owner?(user) = user == owner

  def balance = incomes.sum(:amount) - expenses.sum(:amount)
end
