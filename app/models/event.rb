class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  paginates_per 10

  def end_date_after_start_date
    if end_date >= start_date
      return
    end

    errors.add(:end_date, "End Datum darf nicht vor dem Start Datum sein")
  end
end
