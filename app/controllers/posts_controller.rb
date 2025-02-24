class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show destroy edit update]

  def index
    @posts = Post.all.includes(:author).order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "Post created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if @post.author != current_user
      redirect_to posts_path, alert: "You are not allowed to edit this post."
    end
  end

  def update
    if @post.author != current_user
      redirect_to posts_path, alert: "You are not allowed to update this post."
    end

    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.author != current_user
      redirect_to posts_path, alert: "You are not allowed to delete this post."
    end

    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path, notice: "Post deleted successfully." }
      format.turbo_stream
    end
  end

  private
  def post_params
    params.expect(post: [ :title, :content ])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
