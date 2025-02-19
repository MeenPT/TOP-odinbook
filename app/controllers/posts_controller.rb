class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.includes(:author)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.expect(post: [ :title, :content ])
  end
end
