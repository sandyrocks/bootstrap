class LikesController < ApplicationController
  include ApplicationHelper
  def index
		if  params[:id].present?
  		@post = Post.find_by_id(params[:id])
  		if @post
  			@likes          = Like.where(:user_id => current_user.id,:post_id => params[:id]).first
  			@likes        ||= @post.likes.build
  			@likes.user_id  = current_user.id
  			@likes.like     = params[:key]
  			@likes.save
  		end
  	end
   @values = (show_all_likes_count(params[:id],current_user.id)).to_s if params[:id]
   respond_to do |format|
   	format.json { render :json => @values.to_json }
   end
  end
end
