class EventsController < ApplicationController

	def index
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
	  @event = Event.create(event_params.merge({organization_id: params[:organization_id]}))
    redirect_to event_path(@event.id)
	end

	private


	
	def event_params
		params.require(:event).permit(:name, :event_picture, :date_time, :location, :number_attending, :description, :event_email)
	end
end
