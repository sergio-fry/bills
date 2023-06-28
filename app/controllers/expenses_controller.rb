class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]
  before_action :set_organization

  # GET /expenses or /expenses.json
  def index
    @expenses = Expense.all
    authorize ExpensePolicy.new(current_user, :expense, organization: @organization).index?
  end

  # GET /expenses/1 or /expenses/1.json
  def show
    authorize @expense
  end

  class NewExpense < SimpleDelegator
    attr_reader :organization

    def initialize(expense, organization:)
      super expense
      @organization = organization
    end
  end

  # GET /expenses/new
  def new
    @expense = NewExpense.new(
      Expense.new,
      organization: @organization
    )
    authorize @expense
  end

  # GET /expenses/1/edit
  def edit
    authorize @expense
  end

  # POST /expenses or /expenses.json
  def create
    Create.new(
      expense_params:,
      context: self
    ).call
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    authorize @expense
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to organization_url(@organization), notice: t('expense_updated') }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url, notice: t('expense_destroyed') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  def organization = @organization

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:comment, :amount)
  end
end
