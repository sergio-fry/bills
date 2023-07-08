class IncomesController
  class Create
    def initialize(income_params:, context:)
      @context = context
      @income_params = income_params
    end

    def call
      init_income
      authorize
      create
      respond
    end

    def track_income
      @track_income ||= Domain::TrackIncome.new(
        creator: current_user,
        membership:,
        amount:
      )
    end

    def create = @result = track_income.call
    def init_income = @income = track_income.income

    def membership = Membership.find @income_params[:membership_id]
    def amount = @income_params[:amount].to_f

    def respond
      respond_to do |format|
        if @result.success?
          format.html { redirect_to income_url(@result.income), notice: t('income_created') }
          format.json { render :show, status: :created, location: @result.income }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @result.errors, status: :unprocessable_entity }
        end
      end
    end

    def authorize = @context.send :authorize, @income
    def current_user = @context.current_user

    def respond_to(&) = @context.respond_to(&)
    def income_url(income) = @context.organization_transactions_url income.organization
    def t(key) = @context.translate(key)

    def redirect_to(loc, notice:) = @context.redirect_to loc, notice:
  end
end
