class AttendanceConfirmationsController < ApplicationController

	def create
		#changed create to first or create
		AttendanceConfirmation.first_or_create({user_id: params[:user_id], event_id: params[:event_id]})
		redirect_to event_path(params[:event_id])
	end

	def destroy
		att = AttendanceConfirmation.find(params[:id])
		event_id = att.event_id
		att.destroy
		redirect_to event_path(event_id)
	end

end
