class Expense < Transaction
  validates :amount, numericality: { less_then: 0 }
end
