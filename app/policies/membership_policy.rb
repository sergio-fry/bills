class MembershipPolicy < ApplicationPolicy
  def create? = organization.owner?(user)

  def new? = create?
  def show? = member?

  def organization = record.organization

  def member? = organization.member? user

  class Scope < Scope
    def resolve
      scope
    end
  end
end
