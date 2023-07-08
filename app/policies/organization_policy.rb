class OrganizationPolicy < ApplicationPolicy
  def index? = true
  def create? = true
  def new? = create?
  def show? = member?
  def edit? = owner?
  def update? = edit?
  def destroy? = owner?
  def add_member? = owner?
  def transactions? = member?
  def memberships? = member?

  class Scope < Scope
    def resolve
      scope.with_member(user)
    end
  end

  private

  def member? = record.member? user
  def owner? = record.owner? user
end
