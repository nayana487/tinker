class PostsController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # index
  def index
    @posts = Post.all
  end

  # new
  def new
    @fan = Fan.find(params[:fan_id])
    # @post = @fan.posts.new
  end

  # create
  def create
    @fan = Fan.find(params[:fan_id])
    @post = @fan.posts.create(post_params)
    redirect_to fan_post_path(@fan, @post)
  end

  #show
  def show
    @post = Post.find(params[:id])
    @fan = Fan.find(@post.fan_id)
  end

  # edit
  def edit
    @post = Post.find(params[:id])
    @fan = Fan.find(@post.fan_id)
  end

  # update
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    @fan = Fan.find(@post.fan_id)
    redirect_to fan_post_path(@fan, @post)
  end

  # destroy
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @fan = Fan.find(@post.fan_id)

    redirect_to fan_path(@house)
  end

  private
  def post_params
    params.require(:post).permit(:shoe_name, :shoe_photo, :fan_message)
  end
end
