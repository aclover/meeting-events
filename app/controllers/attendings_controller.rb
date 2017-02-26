class AttendingsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
    event = Event.find(params[:event_id])
    attending = Attending.create(user: current_user, event: event)
    redirect_to '/events'
  end

  def destroy
    @attending = Attending.find(params[:id]).destroy
    # render json:@attending
    redirect_to '/events'
  end
end
