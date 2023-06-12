class Income < ApplicationRecord
  belongs_to :membership
  delegate :organization, to: :membership
  delegate :member, to: :membership
end
