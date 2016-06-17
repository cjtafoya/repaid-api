class Api::V1::GroupsController < ApplicationController

  def index
    render json: Group.all
  end

  def show
    render json: group
  end

  def create
    binding.pry
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
    output = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    output.delete(:group_id) if output.keys.include?(:group_id)
    output.delete(:attendee_id) if output.keys.include?(:attendee_id)
    output
  end

end
