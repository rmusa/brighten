class StaticController < ApplicationController

	def home		
	  redirect_to user_path(current_user) if signed_in?
	  render layout: "homepage.html.erb"
	end

end
