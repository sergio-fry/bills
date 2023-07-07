module Domain
  class TrackExpense
    def initialize(creator:, organization:, comment:, amount:)
      @creator = creator
      @organization = organization
      @comment = comment
      @amount = amount
    end

    Result = Data.define(:success?, :errors, :expense)

    def call
      if expense.save
        Result.new(success?: true, errors: [], expense:)
      else
        Result.new(success?: false, errors: expense.errors, expense:)
      end
    end

    def expense
      @expense ||= Expense.new(
        amount: -@amount.abs,
        comment: @comment,
        organization: @organization
      )
    end
  end
end
