class EventsController < ApplicationController

	def index
		@events = Kaminari.paginate_array(Event.search(params)).page(params[:page]).per(5)
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
	  	@event = Event.create(event_params.merge({organization_id: params[:organization_id]}))
	  	if @event.save
		  	if params[:tag_names].present?
			  	params[:tag_names].each do |name|
					Tagging.create(tag_id: Tag.find_by(name: name).id, taggable: @event)
				end
		  	end
	    	redirect_to event_path(@event)
	    else
	    	render :new
	    end
	end

	def edit
		@event = Event.find(params[:id])
		redirect_to event_path(@event) unless current_user == @event.organization.owner
	end

	def update
		@event = Event.find(params[:id])
		if @event.update(event_params)
			if current_user == @event.organization.owner
				@event.update(event_params)
				@event.taggings.destroy_all
				params[:tag_names].each do |name|
					Tagging.create(tag_id: Tag.find_by(name: name).id, taggable: @event)
				end
		  	end
			redirect_to event_path(@event)
		else
			render :edit
		end
	end

	def destroy
		event = Event.find(params[:id])
		org_id = event.organization.id
		event.destroy
		redirect_to organization_path(org_id)
	end


	private

	def event_params
		params.require(:event).permit(:name, :date, :time, :location, :number_attending, :description, :event_email, :endtime)
	end
end
