class Api::V1::UsersController < ApplicationController

  skip_before_action :authenticate

  def index
    render json: User.all
  end

  def show
    render json: user
  end

  def create
    user = User.create(user_params)
    render json: user
  end

  def update
    render json: user.update(user_params)
  end

  def destroy
    render json: user.destroy
  end

  private

  def user
    User.find(params[:id])
  end

  def user_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

end
