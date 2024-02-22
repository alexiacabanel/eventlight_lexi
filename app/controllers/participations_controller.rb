class ParticipationsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    Participation.new(event: @event, user: current_user, stripe_customer_id: current_user.id)
  end
end
