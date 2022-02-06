class PostsController < ApplicationController
  before_action :check_user, only: %i[update delete]
  
  def create
    post = Post.create(post_params)
    render json: { id: post.id }
  end

  def update
    @post.update(post_params)
    render json: @post
  end

  def delete
    @post.destroy
    render json: { message: 'The post was successfuly deleted' }
  end

  def get_by
    posts = Post.where(filter_params)
    render json: posts
  end

  private
  def post_params
    params.permit(:content, :user_id, :category)
  end

  def check_user
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    render status: 403, json: { message: "Sorry, it's not ur post" } unless @post.user_id == @user.id
  end

  def filter_params
    params.permit(:category, :created_at, :user_id)
  end

end
