class MembershipsController < ApplicationController
  before_action :set_organization
  before_action :set_membership, only: %i[show edit update destroy]

  # GET /memberships or /memberships.json
  def index
    @memberships = Membership.all
    authorize [@organization, :memberships], policy_class: MembershipPolicy
  end

  # GET /memberships/1 or /memberships/1.json
  def show
    authorize [@organization, @membership], policy_class: MembershipPolicy
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
    authorize [@organization, @membership], policy_class: MembershipPolicy
  end

  # GET /memberships/1/edit
  def edit
    authorize [@organization, @membership], policy_class: MembershipPolicy
  end

  # POST /memberships or /memberships.json
  def create
    Create.new(self, membership_params:, organization: @organization).call
  end

  # PATCH/PUT /memberships/1 or /memberships/1.json
  def update
    authorize [@organization, @membership], policy_class: MembershipPolicy
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to membership_url(@membership), notice: t('membership_updated') }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1 or /memberships/1.json
  def destroy
    authorize [@organization, @membership], policy_class: MembershipPolicy
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
