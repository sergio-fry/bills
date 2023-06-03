module Domain
  class CreateOrganization
    def initialize(creator:, organization:)
      @creator = creator
      @organization = organization
    end

    Result = Data.define(:success?, :errors, :organization)

    def call
      @organization.memberships.build(user: @creator, role: :owner)

      if @organization.save
        Result.new(success?: true, errors: [], organization: @organization)
      else
        Result.new(success?: false, errors: @organization.errors, organization: @organization)
      end
    end
  end
end
