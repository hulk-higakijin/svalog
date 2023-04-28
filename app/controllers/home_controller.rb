class HomeController < ApplicationController
  def index
    redirect_to members_shifts_path if user_signed_in?
  end
end
