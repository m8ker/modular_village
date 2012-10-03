class VotesController < ApplicationController

	before_filter :authenticate_user!
	# def new
	# 	@vote = Vote.new
	# end

  def create
  		@vote = current_user.votes.where(:link_id => params[:vote][:link_id]).first
  		if @vote.present? && @vote.up == current_user.votes.create(params[:vote]).up
  			@vote.destroy
  		else
  			@vote ||= current_user.votes.create(params[:vote])
  			@vote.update_attributes(:up => params[:vote][:up])
  		end
  		redirect_to :back
  	end

end