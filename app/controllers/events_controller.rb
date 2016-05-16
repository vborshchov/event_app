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
    @event = Event.new(event_params.merge(user_id: current_user.id)) if user_signed_in?

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
   def event_params
      params.require(:event).permit(:name, :address, :description, :event_date, :event_time, :min_users, :max_users, :user_id)
    end
end
