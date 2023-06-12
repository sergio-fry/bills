class IncomePolicy < ApplicationPolicy
  def create? = organization.owner? user
  alias new? create?

  def show? = organization.member? user

  delegate :organization, to: :record

  class Scope < Scope
    def resolve
      scope
    end
  end
end
