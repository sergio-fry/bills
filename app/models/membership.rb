class Membership < ApplicationRecord
  belongs_to :member, class_name: 'User', foreign_key: :user_id, inverse_of: :memberships
  belongs_to :organization
end
