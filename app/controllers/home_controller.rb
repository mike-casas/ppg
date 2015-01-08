class HomeController < ApplicationController
  before_action :validuser
  def index
  end

private
  def validuser
      if user_signed_in?
        redirect_to dashboard_index_path
      end
  end
end
