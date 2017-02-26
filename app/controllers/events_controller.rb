class EventsController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    @events = Event.where(state:current_user.state)
    @other_events = Event.where.not(state:current_user.state)
  end

  def new
    @event = Event.find_by_id(params[:id])
    # render json: @event
  end

  def edit
    @user = User.find_by_id(session[:user_id])
  	@event = Event.find_by_id(params[:id])
    @comments = Comment.all
    # render json:@comments
    # render json:@event
    # render json: @event.users_attendings.count
  end

  def show
  end

  def create
    if params[:event][:date] < Time.now.to_s
      flash[:date_error] = "Dates can only be selected from future days"
      return redirect_to '/events'
    end

    @event = Event.create event_params
    if @event.save
      redirect_to '/events'
    else
      flash[:event_error] = @event.errors.full_messages
      redirect_to '/events'
    end
  end

  def update
    # fail

    @event = Event.update(params[:id], event_params)

    if @event.save
      redirect_to '/events'
    else
      flask['update_error']= "not valid"
      redirect_to "/events/#{params[:id]}/edit"
    # render json: @event
    # redirect_to '/events'
  end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy if event.user == current_user
    redirect_to "/events"
  end


  private

	def event_params
		params.require(:event).permit(:name, :date, :location, :state).merge(user: current_user)
	end
end
