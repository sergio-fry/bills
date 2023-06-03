# healcheck to check if app is already up
class HealthcheckController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    authorize :healthcheck
    render plain: 'OK'
  end
end
