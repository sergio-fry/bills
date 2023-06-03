class Organization < ApplicationRecord
  validates :name, presence: true
  has_many :memberships, dependent: :destroy

  scope :with_member, ->(user) { joins(:memberships).where(memberships: { user_id: user.id }) }

  def member?(user) = memberships.exists?(user:)
end
