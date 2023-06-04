class Membership < ApplicationRecord
  belongs_to :member, class_name: 'User', foreign_key: :user_id
end
