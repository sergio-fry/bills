class OrganizationsController
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
      @result = Domain::CreateOrganization.new(
        creator: current_user,
        organization: @organization
      ).call
    end

    def init_organization
      @organization = Organization.new(@organization_params)
    end

    def respond
      respond_to do |format|
        if @result.success?
          format.html { redirect_to organization_url(@result.organization), notice: t('organization_created') }
          format.json { render :show, status: :created, location: @result.organization }
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
