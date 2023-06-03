class Organization < ApplicationRecord
  validates :name, presence: true
  has_many :memberships, dependent: :destroy

  def member?(user) = memberships.exists?(user:)
end
