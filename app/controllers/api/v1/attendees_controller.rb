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
    name = params.require(:data).require(:attributes).require(:name)
    gatheringid = params.require(:data).require(:relationships).require(:gathering).require(:data).require(:id)
    if params.require(:data).require(:relationships).require(:groups).permit(:data)[:data]
      groupids = params.require(:data).require(:relationships).require(:groups).require(:data).map do |group|
        group[:id]
      end
      { name: name, gathering_id: gatheringid, group_ids: groupids }
    else
      { name: name, gathering_id: gatheringid }
    end
  end

end
