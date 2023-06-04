class IncomesController < ApplicationController
  before_action :set_income, only: %i[show edit update destroy]
  before_action :set_organization

  # GET /incomes or /incomes.json
  def index
    @incomes = Income.all
    authorize IncomePolicy.new(current_user, :income, organization: @organization).index?
  end

  # GET /incomes/1 or /incomes/1.json
  def show; end

  # GET /incomes/new
  def new
    @income = Income.new
    authorize [@organization, @income], policy_class: IncomePolicy
  end

  # GET /incomes/1/edit
  def edit; end

  # POST /incomes or /incomes.json
  def create
    result = Domain::TrackIncome.new(
      creator: current_user,
      organization: @organization,
      income_params:
    )

    respond_to do |format|
      if result.success?
        format.html { redirect_to income_url(@result.income), notice: 'Income was successfully created.' }
        format.json { render :show, status: :created, location: @result.income }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomes/1 or /incomes/1.json
  def update
    respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to income_url(@income), notice: 'Income was successfully updated.' }
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
      format.html { redirect_to incomes_url, notice: 'Income was successfully destroyed.' }
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
    params.require(:income).permit(:member_id, :amount)
  end
end
