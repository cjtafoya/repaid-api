class Api::V1::GatheringsController < ApplicationController

  def index
    render json: current_user.gatherings.includes(:groups, :attendees, :expenses), include: ['attendees', 'groups', 'user', 'expenses']
  end

  def show
    render json: gathering, include: ['attendees', 'groups', 'user', 'expenses']
  end

  def create
    gathering = Gathering.create(gathering_params)
    group = Group.create(name: "Everyone")
    attendee = Attendee.create(name: "Me")
    gathering.attendees << attendee
    group.attendees << attendee
    group.save
    gathering.groups << group
    gathering.save
    render json: gathering
  end

  def update
    render json: gathering.update(gathering_params)
  end

  def destroy
    render json: gathering.destroy
  end

  private

  def gathering
    current_user.gatherings.includes(:groups, :attendees, :expenses).find(params[:id])
  end

  def gathering_params
    output = params.require(:data).require(:attributes).permit(:name, :tagline, :user_id)
    output[:user_id] = Auth.decode(token)["user"]
    output
  end

end
