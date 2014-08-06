class OrganizationsController < ApplicationController

	def index
		@organizations = Kaminari.paginate_array(Organization.search(params)).page(params[:page]).per(5)
	end

	def show
		@organization = Organization.find(params[:id])
	end

	def new
		@organization = Organization.new
	end

	def create
		@organization = Organization.create(organization_params.merge({user_id: current_user.id}))
		if @organization.save
			if params[:tag_names].present?
				params[:tag_names].each do |name|
					Tagging.create(tag_id: Tag.find_by(name: name).id, taggable: @organization)
				end
		  	end
	    	redirect_to organization_path(@organization.id)
	    else
	    	render :new
	    end
	end

	def edit
	  @organization = Organization.find(params[:id]) 
	end

	def update
		@organization = Organization.find(params[:id])
		@organization.update(organization_params)
		if @organization.update(organization_params)
			@organization.taggings.destroy_all
			params[:tag_names].each do |name|
				Tagging.create(tag_id: Tag.find_by(name: name).id, taggable: @organization)
			end
			redirect_to organization_path(@organization)
		else
			render :edit
		end
	end

	def destroy
		Organization.find(params[:id]).destroy
		redirect_to events_path
	end


	private

	def organization_params
		params.require(:organization).permit(:name, :picture, :phone, :email, :description, :website, :address)
	end

end
