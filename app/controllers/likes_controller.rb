class LikesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		if @post.likes.find_by(:user_id => current_user.id).nil?
			@post.likes.create(:user_id => current_user.id)
			redirect_to post_path(@post)
		else
			redirect_to post_path(@post)
		end
	end

	def destroy
		@like = Likes.find(params[:id])
		@like.destroy
	end



end
