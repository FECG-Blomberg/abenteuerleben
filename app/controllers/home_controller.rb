class HomeController < ApplicationController
  def index
    @camp = Campyear.active_camp

    @events = Event
              .where(['start_date >= ? OR end_date >= ?', Time.zone.today, Time.zone.today])
              .order('start_date ASC')

    @message = Message.new flash[:message]
    @message.errored = true if flash[:message]

    render :index_galaxy, layout: 'default'
  end
end
