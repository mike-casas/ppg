class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout :dashboard
  def index
  end

  private

  def dashboard
     if user_signed_in?
        "Dashboard"
     end
  end
end
