class OrganizationPolicy < ApplicationPolicy
  def index? = true
  def create? = true
  def new? = create?
  def show? = record.member? user
  def edit? = record.owner? user
  def update? = edit?
  def destroy? = record.owner? user

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
