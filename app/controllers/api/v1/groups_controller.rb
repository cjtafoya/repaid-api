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
    name = params.require(:data).require(:attributes).require(:name)
    gatheringid = params.require(:data).require(:relationships).require(:gathering).require(:data).require(:id)
    if params.require(:data).require(:relationships).require(:attendees).permit(:data)[:data]
      attendeeids = params.require(:data).require(:relationships).require(:attendees).require(:data).map do |group|
        group[:id]
      end
      { name: name, gathering_id: gatheringid, attendee_ids: attendeeids }
    else
      { name: name, gathering_id: gatheringid }
    end
  end

end
