class OrganizationsController < ApplicationController

	def index
		@organizations = Organization.all
	end

	def show
		@organization = Organization.find(params[:id])
	end

	def new
		@organization = Organization.new
	end

	def create
		@organization = Organization.create(organization_params.merge({user_id: current_user.id}))
		
		params[:tag_names].each do |name|
			Tag.create(name: name, taggable: @organization)
		end

    redirect_to organization_path(@organization.id)
	end

	def edit
	  @organization = Organization.find(params[:id]) 
	end

	def update
		@organization = Organization.find(params[:id])
		@organization.update(organization_params)
		redirect_to organization_path(@organization)
	end

	def destroy
		Organization.find(params[:id]).destroy
		redirect_to user_path(current_user)
	end


	private

		def organization_params
		params.require(:organization).permit(:name, :organization_picture, :phone, :email, :description, :website, :address)
	end
end
