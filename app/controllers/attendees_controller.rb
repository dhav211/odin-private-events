class AttendeesController < ApplicationController
  def create
    event = Event.find_by id: params[:event]
    event.attending_users << current_user

    redirect_to event, notice: 'Event joined!'
  end

  def destroy
    event = Event.find_by id: params[:id]
    attendee = event.attendees.find_by user: current_user
    attendee.destroy
    redirect_to event
  end
end
