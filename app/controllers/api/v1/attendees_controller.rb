class Api::V1::AttendeesController < ApplicationController

  def index
    render json: Attendee.all
  end

  def show
    render json: attendee
  end

  def create
    render json: Attendee.create(attendee_params)
  end

  def update
    render json: attendee.update(attendee_params)
  end

  def destroy
    render json: attendee.destroy
  end

  private

  def attendee
    Attendee.find(params[:id])
  end

  def attendee_params
    params.require(:attendee).permit(:name)
  end

end
