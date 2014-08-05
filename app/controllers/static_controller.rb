class StaticController < ApplicationController

	def home		
	  if signed_in?
		  redirect_to events_path
	  else
	  	render layout: "homepage.html.erb"
	  end
	end

	def edit
		render layout: "application.html.erb"
	end

end

#0060FF - dark blue
