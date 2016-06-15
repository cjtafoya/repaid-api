class Api::V1::GroupsController < ApplicationController

  def index
    render json: Group.all
  end

  def show
    render json: group
  end

  def create
    render json: Group.create(group_params)
  end

  def update
    render json: group.update(group_params)
  end

  def destroy
    render json: group.destroy
  end

  private

  def group
    Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end

end
