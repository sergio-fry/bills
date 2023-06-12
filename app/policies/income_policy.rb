class IncomePolicy < ApplicationPolicy
  def create?(organization = record.organization) = organization.owner? user
  alias new? create?

  def update?(organization = record.organization) = organization.owner? user
  alias edit? update?

  def show?(organization = record.organization) = organization.member? user

  class Scope < Scope
    def resolve
      scope
    end
  end
end
