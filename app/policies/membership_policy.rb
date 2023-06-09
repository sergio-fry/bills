class MembershipPolicy < ApplicationPolicy
  def create? = owner?
  def new? = create?

  def update? = owner?
  def edit? = create?

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
