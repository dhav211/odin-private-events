class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    @created_events = @user.created_events.all
    @attending_events = @user.attending_events.all
  end
end
