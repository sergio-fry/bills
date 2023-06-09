class MembershipsController
  class Update
    def initialize(context, membership_params:, organization:)
      @context = context
      @membership_params = membership_params
      @organization = organization
    end

    def call
      ApplicationRecord.transaction do
        update_member
        authorize
      end

      respond
    end

    def update_member
      @result = Domain::UpdateMember.new(
        membership:,
        phone: @membership_params[:phone],
        name: @membership_params[:name]
      ).call

      @membership = @result.membership
    end

    def membership = Membership.find(@context.params[:id])

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
        redirect_to organization_membership_url(@organization, @membership), notice: t('membership_updated')
      end
      format.json { render :show, status: :ok, location: @membership }
    end

    def respond_fail(format)
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @membership.errors, status: :unprocessable_entity }
    end

    def authorize = @context.send :authorize, @membership, policy_class: MembershipPolicy

    def respond_to(&) = @context.respond_to(&)
    def render(*args) = @context.render(*args)

    def organization_membership_url(organization,
                                    membership)
      @context.organization_membership_url organization, membership
    end

    def t(key) = @context.translate(key)

    def redirect_to(loc, notice:) = @context.redirect_to loc, notice:
  end
end
