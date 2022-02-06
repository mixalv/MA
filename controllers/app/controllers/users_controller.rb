class UsersController < ApplicationController
  def create
    user = User.create(name: params[:name])
    render json: user
  end
end
