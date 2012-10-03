class StarsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@star = current_user.stars.where(:link_id => params[:star][:link_id]).first
		if @star.present?
			@star.destroy
		else
			@star = current_user.stars.create(params[:star])
		end
		redirect_to :back
	end

end