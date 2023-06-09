class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show edit update destroy]

  # GET /organizations or /organizations.json
  def index
    authorize :organization
    @organizations = policy_scope(Organization)
  end

  # GET /organizations/1 or /organizations/1.json
  def show
    authorize @organization
    @memberships = policy_scope @organization.memberships
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
    authorize @organization
  end

  # GET /organizations/1/edit
  def edit
    authorize @organization
  end

  # POST /organizations or /organizations.json
  def create
    Create.new(
      context: self,
      organization_params:
    ).call
  end

  # PATCH/PUT /organizations/1 or /organizations/1.json
  def update
    authorize @organization

    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to organization_url(@organization), notice: t('organization_updated') }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1 or /organizations/1.json
  def destroy
    authorize @organization

    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url, notice: t('organization_destroyed') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = policy_scope(Organization).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def organization_params
    params.require(:organization).permit(:name)
  end
end
