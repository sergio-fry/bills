class HomeController < ApplicationController
  def show
    authorize :home

    if current_user.primary_organization.blank?
      redirect_to new_organization_url
    else
      redirect_to organization_url(current_user.primary_organization)
    end
  end
end
