# healcheck to check if app is already up
class HealthcheckController < ApplicationController
  def show
    render plain: 'OK'
  end
end
