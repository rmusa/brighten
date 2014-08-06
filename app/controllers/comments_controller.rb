class CommentsController < ApplicationController 
	def create
		Comment.create(comment_params.merge(user_id: current_user.id))
		redirect_to event_path(params[:comment][:event_id])
	end

	def destroy
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :user_id, :event_id)
	end

end