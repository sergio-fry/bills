# healcheck to check if app is already up
class HealthcheckController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    render plain: 'OK'
  end
end
