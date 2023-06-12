class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!
  after_action :verify_authorized, unless: -> { devise_controller? }

  around_action :switch_locale

  def switch_locale(&)
    if signed_in?
      locale = current_user.locale || I18n.default_locale
      I18n.with_locale(locale, &)
    else
      I18n.with_locale(I18n.default_locale, &)
    end
  end
end
