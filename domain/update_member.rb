module Domain
  class UpdateMember
    def initialize(membership:, phone:, name:)
      @membership = membership
      @phone = phone
      @name = name
    end

    Result = Data.define(:success?, :errors, :membership)

    def call
      @membership.member.name = @name
      @membership.member.phone = @phone

      if @membership.save
        Result.new(success?: true, errors: [], membership: @membership)
      else
        Result.new(success?: false, errors: @membership.errors, membership:)
      end
    end
  end
end
