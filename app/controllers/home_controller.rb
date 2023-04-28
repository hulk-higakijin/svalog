class HomeController < ApplicationController
  def index
    redirect_to shifts_members_path if user_signed_in?
  end
end
