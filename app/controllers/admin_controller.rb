class AdminController < ApplicationController
  before_action :admin_only

  def dashboard
    @unread_messages = Message.where(read: nil).or(Message.where(read: false)).count

    year = Campyear.active_camp.year
    @helper_count = Helper
               .joins(registrations: { camp: :campyear })
               .where('campyears.year = ?', year)
               .distinct
               .count

    @child_count = Child
                     .joins(camp: :campyear)
                     .where('campyears.year = ?', year)
                     .distinct
                     .count

    @child_count = Child.all.count
  end

  def dev; end
end
