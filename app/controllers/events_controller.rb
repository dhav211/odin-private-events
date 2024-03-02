class EventsController < ApplicationController
  def index
    @events = case params[:show]
              when "all"
                Event.all
              when "upcoming"
                Event.upcoming
              when "past"
                Event.past
              when "has_attendees"
                Event.has_attendees
              else
                Event.all
              end
  end

  def show
    @event = Event.find_by id: params[:id]
    @attendees = @event.attending_users.all
  end

  def new
    @new_event = Event.new
  end

  def create
    @new_event = Event.new allowed_params
    @new_event.creator = current_user

    if @new_event.save
      redirect_to @new_event, notice: 'Event created sucessfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find_by id: params[:id]
  end

  def update
    @event = Event.find_by id: params[:id]
    if @event.update allowed_params
      redirect_to @event, notice: 'Event edited.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find_by id: params[:id]
    @event.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def allowed_params
    params.require(:event).permit(:name, :location, :date, :description, :creator)
  end
end
