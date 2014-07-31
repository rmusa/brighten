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
	  @event = Event.create(event_params.merge({organization_id: params[:organization_id]}))
	  params[:tag_names].each do |name|
			Tagging.create(tag_id: Tag.find_by(name: name).id, taggable: @event)
		end
    redirect_to event_path(@event)
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@event.update(event_params)
		@event.taggings.destroy_all
		params[:tag_names].each do |name|
			Tagging.create(tag_id: Tag.find_by(name: name).id, taggable: @event)
		end
		redirect_to event_path(@event)
	end

	def destroy
		event = Event.find(params[:id])
		org_id = event.organization.id
		event.destroy
		redirect_to organization_path(org_id)
	end


	private

	def event_params
		params.require(:event).permit(:name, :event_picture, :date_time, :location, :number_attending, :description, :event_email)
	end
end
