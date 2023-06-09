class MembershipsController < ApplicationController
  before_action :set_organization
  before_action :set_membership, only: %i[show edit update destroy]

  # GET /memberships or /memberships.json
  def index
    @memberships = policy_scope @organization.memberships
    authorize :memberships, policy_class: MembershipPolicy
  end

  # GET /memberships/1 or /memberships/1.json
  def show
    authorize @membership, policy_class: MembershipPolicy
  end

  # GET /memberships/new
  def new
    @membership = Membership.new(
      organization: @organization
    )
    authorize @membership, policy_class: MembershipPolicy
  end

  # GET /memberships/1/edit
  def edit
    authorize @membership, policy_class: MembershipPolicy
  end

  # POST /memberships or /memberships.json
  def create
    Create.new(self, membership_params:, organization: @organization).call
  end

  # PATCH/PUT /memberships/1 or /memberships/1.json
  def update
    Update.new(self, membership_params:, organization: @organization).call
    authorize @membership, policy_class: MembershipPolicy
  end

  # DELETE /memberships/1 or /memberships/1.json
  def destroy
    authorize @membership, policy_class: MembershipPolicy
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to memberships_url, notice: t('membership_deleted') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_membership
    @membership = Membership.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def membership_params
    params.require(:membership).permit(:name, :phone)
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end
end
