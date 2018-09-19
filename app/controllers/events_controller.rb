class EventsController < ApplicationController
  before_action :load_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = events_with_current_user.sort_by(&:start_event)
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  private

  def load_event
    @event = Event.find_by(id: params[:id]) || not_found
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, :start_event, :end_event, user_ids: [])
  end

  def events_with_current_user
    current_user.events + Event.all.inject([]) { |events, e| events << e if e.users.include?(current_user); events }
  end
end
