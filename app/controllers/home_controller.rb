class HomeController < ApplicationController
  def index
    redirect_to members_today_path if user_signed_in?
  end
end
