class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(user: current_user)

    if @like.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to posts_path, notice: "Post liked!" }
      end
    else
      redirect_to posts_path, alert: "Unable to like post."
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(user: current_user)

    if @like.destroy
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to posts_path, notice: "Like removed." }
      end
    else
      redirect_to posts_path, alert: "Unable to unlike post."
    end
  end
end
