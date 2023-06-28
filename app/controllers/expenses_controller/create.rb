class ExpensesController
  class Create
    def initialize(expense_params:, context:)
      @context = context
      @expense_params = expense_params
    end

    def call
      init_expense
      authorize
      create
      respond
    end

    def track_expense
      @track_expense ||= Domain::TrackExpense.new(
        creator: current_user,
        organization:,
        comment:,
        amount:
      )
    end

    def amount = @expense_params[:amount]
    def comment = @expense_params[:comment]
    def create = @result = track_expense.call
    def init_expense = @expense = track_expense.expense
    def organization = @context.send(:organization)

    def respond
      respond_to do |format|
        if @result.success?
          format.html { redirect_to expense_url(@result.expense), notice: t('expense_created') }
          format.json { render :show, status: :created, location: @result.expense }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @result.errors, status: :unprocessable_entity }
        end
      end
    end

    def authorize = @context.send :authorize, @expense
    def current_user = @context.current_user

    def respond_to(&) = @context.respond_to(&)
    def expense_url(expense) = @context.organization_url expense.organization, expense
    def t(key) = @context.translate(key)

    def redirect_to(loc, notice:) = @context.redirect_to loc, notice:
  end
end
