class HomeController < ApplicationController
  def index
    @helper_registration_open = false
    @participants_registration_open = false

    @events = Event
              .where(['start_date >= ? OR end_date >= ?', Time.zone.today, Time.zone.today])
              .order('start_date ASC')

    @message = Message.new

    @no_header = true
  end
end
