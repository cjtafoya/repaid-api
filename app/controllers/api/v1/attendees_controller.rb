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
    output = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    output.delete(:group_id) if output.keys.include?(:group_id)
    output.delete(:attendee_id) if output.keys.include?(:attendee_id)
    output
  end

end
