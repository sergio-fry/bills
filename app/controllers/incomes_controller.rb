class IncomesController < ApplicationController
  before_action :set_income, only: %i[show edit update destroy]
  before_action :set_organization

  # GET /incomes or /incomes.json
  def index
    @incomes = Income.all
    authorize IncomePolicy.new(current_user, :income, organization: @organization).index?
  end

  # GET /incomes/1 or /incomes/1.json
  def show
    authorize @income
  end

  class NewIncome < SimpleDelegator
    attr_reader :organization

    def initialize(income, organization:)
      super income
      @organization = organization
    end
  end

  # GET /incomes/new
  def new
    @income = NewIncome.new(
      Income.new,
      organization: @organization
    )
    authorize @income
  end

  # GET /incomes/1/edit
  def edit
    authorize @income
  end

  # POST /incomes or /incomes.json
  def create
    Create.new(
      income_params:,
      context: self
    ).call
  end

  # PATCH/PUT /incomes/1 or /incomes/1.json
  def update
    authorize @income
    respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to organization_url(@organization), notice: t('income_updated') }
        format.json { render :show, status: :ok, location: @income }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1 or /incomes/1.json
  def destroy
    @income.destroy

    respond_to do |format|
      format.html { redirect_to incomes_url, notice: t('income_destroyed') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_income
    @income = Income.find(params[:id])
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  # Only allow a list of trusted parameters through.
  def income_params
    params.require(:income).permit(:membership_id, :amount)
  end
end
