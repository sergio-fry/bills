module Domain
  class AddMember
    def initialize(creator:, user:, organization:, role:)
      @creator = creator
      @user = user
      @organization = organization
      @role = role
    end

    Result = Data.define(:success?, :errors, :membership)

    def call
      Result.new(success?: false, errors: [:already_member]) if already_member?

      membership = Membership.new(organization: @organization, member: @user, role: @role)

      if membership.save
        Result.new(success?: true, errors: [], membership:)
      else
        Result.new(success?: false, errors: membership.errors, membership:)
      end
    end

    def already_member? = @organization.member? @user
  end
end
