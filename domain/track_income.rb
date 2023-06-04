module Domain
  class TrackIncome
    def initialize(creator:, organization:, income_params:)
      @creator = creator
      @organization = organization
      @income_params
    end

    Result = Data.define(:success?, :errors, :organization)

    def call
      if @income.save
        Result.new(success?: true, errors: [], organization: @organization)
      else
        Result.new(success?: false, errors: @organization.errors, organization: @organization)
      end
    end
  end
end
