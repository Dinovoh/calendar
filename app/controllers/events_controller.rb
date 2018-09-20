class EventsController < ApplicationController
  before_action :load_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = current_user.events.sort_by(&:start_event)
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    binding.pry
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
    params.require(:event).permit(:name, :description, :location, :date, :start_event, :end_event, :creator_id, user_ids: [])
  end

  def events_with_current_user
    Event.all
    # current_user.events + Event.all.inject([]) { |events, e| events << e if e.users.include?(current_user); events }
  end
end
