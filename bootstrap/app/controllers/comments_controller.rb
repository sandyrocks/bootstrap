class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to post_path(@post)
	end

	def edit
		@comment = Comment.find_by_id(params[:id]) if params[:id].present?
	end

	def update
		@comment = Comment.find_by_id(params[:id])
		post_id = @comment.post_id
		@comment.update(comment_params)
		redirect_to post_path(post_id)
	end

	private
		def comment_params
			params.require(:comment).permit(:comment,:user_id)
		end
end
