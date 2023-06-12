class MembershipPolicy < ApplicationPolicy
  def create? = OrganizationPolicy.new(user, organization).add_member?
  alias new? create?
  alias update? create?
  alias edit? create?

  def show? = member?

  delegate :organization, to: :record

  def member? = organization.member? user
  def owner? = organization.owner?(user)

  def destroy? = false

  class Scope < Scope
    def resolve
      scope
    end
  end
end
