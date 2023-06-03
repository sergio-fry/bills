class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    authorize :home
  end
end
