class AttendanceConfirmationsController < ApplicationController

	def create
		AttendanceConfirmation.create({user_id: params[:user_id], event_id: params[:event_id]})
		redirect_to event_path(params[:event_id])
	end

end
