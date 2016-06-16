class Api::V1::GatheringsController < ApplicationController

  def index
    render json: Gathering.includes(:groups, :attendees, :expenses), include: ['attendees', 'groups', 'user', 'expenses']
  end

  def show
    render json: gathering, include: ['attendees', 'groups', 'user']
  end

  def create
    render json: Gathering.create(gathering_params)
  end

  def update
    render json: gathering.update(gathering_params)
  end

  def destroy
    render json: gathering.destroy
  end

  private

  def gathering
    Gathering.find(params[:id])
  end

  def gathering_params
    params.require(:gathering).permit(:name, :user_id)
  end

end
