class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :subscribe]

  def show
    @user = User.find(params[:id])
    @events = Event.where(user: @user)
  end

  def edit

  end

  def subscribe
    @user = User.find(params[:id])
    @user.subscribers << current_user
    redirect_to :back
  end

  private
    def user_params
      params.require(:event).permit(:name, :address, :description, :event_date, :event_time, :min_users, :max_users, :user_id, :category_id)
    end
end
