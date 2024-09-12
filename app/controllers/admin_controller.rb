class AdminController < ApplicationController
  before_action :admin_only

  def dashboard
    @unread_messages = Message.where(read: nil).or(Message.where(read: false)).count

    year = Campyear.active_camp.year
    @helper_count = Helper.from_year(year).count

    @child_count = Child.from_year(year).count
  end

  def dev; end
end
