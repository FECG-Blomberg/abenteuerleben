class Campyear < ApplicationRecord
  has_many :camps, dependent: :destroy

  validates :participants_register_start, presence: true
  validates :members_only_start, presence: true
  validates :participants_register_end, presence: true
  validates :preferredCamp, presence: true

  validate :participant_member_date_earlier_all_date

  def participant_member_date_earlier_all_date
    if !(participants_register_start.nil? || members_only_start.nil?) &&
       participants_register_start >= members_only_start
      return
    end

    errors.add :members_only_date, 'muss gleich oder früher als der Start aller sein'
  end

  def camp_names
    camps.map(&:name)
  end

  def full?
    camps.filter(&:not_full?).empty?
  end

  def open_camps
    camps.filter(&:not_full?)
  end

  def min_child_year
    camps.map{|c| c.participants_year_start}.min
  end

  def max_child_year
    camps.map{|c| c.participants_year_end}.max
  end

  def helpers_open
    return false if helper_register_start == nil || helper_register_end == nil

    DateTime.now > helper_register_start && DateTime.now < helper_register_end
  end

  def participants_open
    return false if participants_register_start == nil || participants_register_end == nil

    DateTime.now > participants_register_start && DateTime.now < participants_register_end
  end

  def participant_registrations_open
    return false if members_only_start == nil || participants_register_start == nil

    bigger_than_start = DateTime.now >= members_only_start || DateTime.now >= participants_register_start
    smaller_than_end = DateTime.now <= participants_register_end
    bigger_than_start && smaller_than_end
  end

  def self.active_camp
    Campyear.last || Campyear.new
  end
end
