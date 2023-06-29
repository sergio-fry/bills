class Transaction < ApplicationRecord
  belongs_to :organization

  def description = comment
end
