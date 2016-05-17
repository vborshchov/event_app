class EventsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :subscribe]

  def index
    @events = Event.all
    if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC")
    else
      @events = Event.all.order('created_at DESC')
    end
  end

  def new
    @event = Event.new()
  end

  def create
    @event = Event.new(event_params)
    @event.event_date = Date.strptime(params[:event][:event_date], "%d/%m/%Y")
    @event.user = current_user

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def subscribe
    @event = Event.find(params[:id])
    @event.users << current_user
    redirect_to :back
  end

  private
   def event_params
      params.require(:event).permit(:name, :address, :description, :event_date, :event_time, :min_users, :max_users, :user_id, :category_id)
    end
end
