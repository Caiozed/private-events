class EventsController < ApplicationController
	before_action :correct_user, only: [:new, :create]

	def index
		@events = Event.all
	end

  def new
  	@event = Event.new
  end

  def create 
  	@event = current_user.events.build(event_params)
  	if @event.save
  		flash[:success] = "Event created"
  		redirect_to @event
  	else
  		render :new
  	end
  end

  def show
  	@event = Event.find(params[:id])
  end

  private 

  def event_params
  	params.require(:event).permit(:event_date, :event_name, :event_description)
  end
end
