module EventsHelper
  def current_user_event_creator?(event)
    current_user == event.creator
  end

  def current_user_attending_event?(event)
    user_signed_in? && event.attending_users.where(id: current_user.id).exists?
  end
end
