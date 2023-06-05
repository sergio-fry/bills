class MembershipsController
  class Create
    def initialize(context, membership_params:, organization:)
      @context = context
      @membership_params = membership_params
      @organization = organization
    end

    def call
      ApplicationRecord.transaction do
        @user = Domain::CreateUserByPhone.new(
          phone: @membership_params[:phone],
          name: @membership_params[:name],
          creator: @context.current_user
        ).call.user

        @result = Domain::AddMember.new(
          organization: @organization,
          user: @user,
          role: :member,
          creator: @context.current_user
        ).call

        @membership = @result.membership
        authorize
      end

      respond_to do |format|
        if @membership.save
          format.html { redirect_to membership_url(@membership), notice: t('membership_created') }
          format.json { render :show, status: :created, location: @membership }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @result.errors, status: :unprocessable_entity }
        end
      end
    end

    def authorize = @context.send :authorize, [@organization, @membership], policy_class: MembershipPolicy

    def respond_to(&) = @context.respond_to(&)
    def membership_url(organization) = @context.membership_url organization
    def t(key) = @context.translate(key)

    def redirect_to(loc, notice:) = @context.redirect_to loc, notice:
  end
end
