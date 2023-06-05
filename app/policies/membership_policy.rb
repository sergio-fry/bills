class MembershipPolicy < ApplicationPolicy
  def initialize(user, record)
    super(user, record[1])
    @organization = record[0]
  end

  def new?
    OrganizationPolicy.new(user, @organization).new?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
