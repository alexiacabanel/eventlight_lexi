class ParticipationsController < ApplicationController
  def index
    @event = params[:event_id]
    @participations = Participation.where(event: @event)
  end

  def new
    @event = Event.find(params[:event_id])
    Participation.new(event: @event, user: current_user, stripe_customer_id: current_user.id)
  end
end
