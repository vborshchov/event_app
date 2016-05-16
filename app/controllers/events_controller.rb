class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    if user_signed_in?
      @event = Event.new()
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @event = Event.new(event_params)
    @event.event_date = Date.strptime(params[:event][:event_date], "%d/%m/%Y")
    @event.user = current_user if user_signed_in?

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
   def event_params
      params.require(:event).permit(:name, :address, :description, :event_date, :event_time, :min_users, :max_users, :user_id, :category_id)
    end
end
