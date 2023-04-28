class Members::ShiftsController < ApplicationController
  include Shiftable
  before_action :authenticate_user!
  before_action :set_dates
  before_action :set_members

  def show
    @shifts = Shift.where(date: @date, user_id: @members.pluck(:id)).order(:start_at)
  end

  private

    def set_members
      @members = User.all # あとで所属会社のユーザーだけにする
    end
end
