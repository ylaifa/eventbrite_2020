class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params.merge(user_id: current_user.id))
    if @event.save
    
    redirect_to event_path(id: @event)
    else
    render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id]) 
  end

  def destroy
    @event = Event.find(params[:id])
		@event.destroy
		redirect_to root_path
  end

  private

  def event_params
     params.require(:event).permit(:start_date, :duration, :description, :title, :price, :location)
  end
end
