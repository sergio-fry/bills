class Income < ApplicationRecord
  belongs_to :membership
  delegate :organization, to: :membership
end
