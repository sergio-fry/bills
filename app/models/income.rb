class Income < Transaction
  validates :amount, numericality: { greater_then: 0 }
  belongs_to :membership
  delegate :member, to: :membership

  def description = "#{member.name} #{comment}"
end
