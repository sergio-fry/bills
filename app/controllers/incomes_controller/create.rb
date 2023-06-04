class IncomesController
  class Create
    def initialize(organization_params:, context:)
      @context = context
      @organization_params = organization_params
    end

    def call
      init_organization
      authorize
      create
      respond
    end

    def create
      @result = Domain::TrackIncome.new(
        creator: current_user,
        organization: @organization,
        income_params:
      )
    end

    def init_organization
      @organization = Organization.new(@organization_params)
    end

    def respond
      respond_to do |format|
        if result.success?
          format.html { redirect_to income_url(@result.income), notice: t('income_created') }
          format.json { render :show, status: :created, location: @result.income }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @result.errors, status: :unprocessable_entity }
        end
      end
    end

    def authorize = @context.send :authorize, @organization
    def current_user = @context.current_user

    def respond_to(&) = @context.respond_to(&)
    def organization_url(organization) = @context.organization_url organization
    def t(key) = @context.translate(key)

    def redirect_to(loc, notice:) = @context.redirect_to loc, notice:
  end
end
