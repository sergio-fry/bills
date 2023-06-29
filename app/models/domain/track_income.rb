module Domain
  class TrackIncome
    def initialize(creator:, membership:, amount:)
      @creator = creator
      @membership = membership
      @amount = amount
    end

    Result = Data.define(:success?, :errors, :income)

    def call
      if income.save
        Result.new(success?: true, errors: [], income:)
      else
        Result.new(success?: false, errors: income.errors, income:)
      end
    end

    def income
      @income ||= Income.new(
        membership: @membership,
        amount: @amount.abs,
        organization: @membership.organization
      )
    end
  end
end
