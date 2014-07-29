class OrganizationsController < ApplicationController

	def index
	end

	def show
		@organization = Organization.find(params[:id])
	end

	def new
		@organization = Organization.new
	end

	def create
		@organization = Organization.create(organization_params.merge({user_id: current_user.id}))
    redirect_to organization_path(@organization.id)
	end

	private

		def organization_params
		params.require(:organization).permit(:name, :organization_picture, :phone, :email, :description, :website, :address)
	end
end
