class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    @event = Event.find(params[:id])
    comment = @event.comments.create(content: params[:comment], user_id:session[:user_id], event_id:params[:id])
    redirect_to "/events/#{params[:id]}"
    # render json: comment
  end
end
