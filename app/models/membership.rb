class Membership < ApplicationRecord
  belongs_to :member, class_name: 'User', foreign_key: :user_id, inverse_of: :memberships, autosave: true
  belongs_to :organization

  delegate :name, :phone, to: :member, allow_nil: true
end
