class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @new_event = Event.new
  end

  def create
    @new_event = Event.new allowed_params
    @new_event.creator = current_user

    if @new_event.save
      redirect_to root_path, notice: 'Event created sucessfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def allowed_params
    params.require(:event).permit(:name, :location, :date, :creator)
  end
end
