class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    @created_events = @user.created_events.all
  end
end
