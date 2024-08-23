class Admin::EventsController < ApplicationController
  before_action :admin_only
  before_action :set_event, except: %i[ index new create ]

  def index
    @events = Event.page(params[:page] || 1)
  end

  def new
    @event = Event.new
    @event.start_date = Date.today
    @event.end_date = Date.today
  end

  def create
    @event = Event.new event_params

    if @event.save
      response.headers['HX-Redirect'] = admin_events_path
      return 'erfolgreich erstellt'
    end

    render :new
  end

  private
  def set_event
    @event = Event.find(params[id])
  end

  def event_params
    params.require(:event).permit(:id, :title, :description, :start_date, :end_date, :link)
  end
end
