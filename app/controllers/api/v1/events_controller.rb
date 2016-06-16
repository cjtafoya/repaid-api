class Api::V1::EventsController < ApplicationController

  def index
    render json: Event.includes(:groups, :attendees, :expenses), include: ['attendees', 'groups', 'user', 'expenses']
  end

  def show
    render json: event, include: ['attendees', 'groups', 'user']
  end

  def create
    render json: Event.create(event_params)
  end

  def update
    render json: event.update(event_params)
  end

  def destroy
    render json: event.destroy
  end

  private

  def event
    Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :user_id)
  end

end
