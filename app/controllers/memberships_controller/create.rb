class MembershipsController
  class Create
    def initialize(context, membership_params:, organization:)
      @context = context
      @membership_params = membership_params
      @organization = organization
    end

    def call
      ApplicationRecord.transaction do
        create_user
        add_member
        authorize
      end

      respond
    end

    def add_member
      @result = Domain::AddMember.new(
        organization: @organization,
        user: @user,
        role: :member,
        creator: @context.current_user
      ).call

      @membership = @result.membership
    end

    def create_user
      user_result = Domain::CreateUserByPhone.new(
        phone: @membership_params[:phone],
        name: @membership_params[:name],
        creator: @context.current_user
      ).call

      raise user_result.errors.to_json unless user_result.success?

      @user = user_result.user
    end

    def respond
      respond_to do |format|
        if @result.success?
          respond_success format
        else
          respond_fail format
        end
      end
    end

    def respond_success(format)
      format.html do
        redirect_to organization_url(@organization), notice: t('membership_created')
      end
      format.json { render :show, status: :created, location: @membership }
    end

    def respond_fail(format)
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @result.errors, status: :unprocessable_entity }
    end

    def authorize = @context.send :authorize, @membership, policy_class: MembershipPolicy

    def respond_to(&) = @context.respond_to(&)
    def render(*args) = @context.render(*args)

    def organization_url(organization)
      @context.organization_url organization
    end

    def t(key) = @context.translate(key)

    def redirect_to(loc, notice:) = @context.redirect_to loc, notice:
  end
end
