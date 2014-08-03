class OrganizationsController < ApplicationController

	def index
		if params[:tag].present?
			@organizations = Tag.find_tagged_organizations(params[:tag])
		elsif params[:q].present?
			@organizations = Organization.search(params[:q])
		else
			@organizations = Organization.all 
		end
	end

	def show
		@organization = Organization.find(params[:id])
	end

	def new
		@organization = Organization.new
	end

	def create
		@organization = Organization.create(organization_params.merge({user_id: current_user.id}))
		
		if params[:tag_names].present?
			params[:tag_names].each do |name|
				Tagging.create(tag_id: Tag.find_by(name: name).id, taggable: @organization)
			end
	  end

    redirect_to organization_path(@organization.id)
	end

	def edit
	  @organization = Organization.find(params[:id]) 
	end

	def update
		@organization = Organization.find(params[:id])
		@organization.update(organization_params)
		@organization.taggings.destroy_all
		params[:tag_names].each do |name|
			Tagging.create(tag_id: Tag.find_by(name: name).id, taggable: @organization)
		end

		redirect_to organization_path(@organization)
	end

	def destroy
		Organization.find(params[:id]).destroy
		redirect_to user_path(current_user)
	end


	private

	def organization_params
		params.require(:organization).permit(:name, :picture, :phone, :email, :description, :website, :address)
	end

end
