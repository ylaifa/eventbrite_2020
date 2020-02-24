class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :only_creator, only: [:edit, :update, :destroy]
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @administrator = User.find(@event.admin)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params.merge(admin: current_user.id))
    @event.errors.full_messages
    if @event.save
    
    redirect_to event_path(id: @event), notice: "Your Event was created"
    else
    render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id]) 
  end

  def update
    @event = Event.find(params[:id])
     if @event.update(event_params) 

      redirect_to id: @event, notice: "Your Event was updated"
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
		@event.destroy
		redirect_to root_path
  end

  private

  def event_params
     params.require(:event).permit(:start_date, :duration, :description, :title, :price, :location, :admin, :picture)
  end

  def only_creator
    event = Event.find(params[:id])
    unless current_user.id == event.admin
      flash[:notice] = "Vous n'êtes pas le créateur de l'évènement => Impossilble de le modifier."
     redirect_to root_path
    end
  end
end
