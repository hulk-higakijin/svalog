class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_members

  def show
    @shifts = Shift.where(date: Time.zone.today, user_id: @members.pluck(:id)).order(:start_at)
  end

  private

    def set_members
      @members = User.all # あとで所属会社のユーザーだけにする
    end
end
