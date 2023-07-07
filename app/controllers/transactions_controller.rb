class TransactionsController < ApplicationController
  before_action :set_organization

  # GET /expenses or /expenses.json
  def index
    @transactions = policy_scope @organization.transactions
    authorize @organization, :transactions?, policy_class: OrganizationPolicy
  end

  private

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  attr_reader :organization
end
