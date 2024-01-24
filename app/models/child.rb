class Child < ApplicationRecord
  belongs_to :parent, class_name: 'Parent::Parent', optional: true
  belongs_to :camp

  validates :surname, presence: true, on: %i[form create]
  validates :forename, presence: true, on: %i[form create]
  validates :birthday, presence: true, on: %i[form create]
  validates :sex, presence: true, on: %i[form create]
  validates :camp_id, presence: true, on: %i[form create]

  # validates :parent_id, presence: true, on: %i[create]

  def self.from_year year
    Child.joins(camp: :campyear)
       .where('campyears.year': year)
       .order(:surname)
       .distinct
  end

  def invalid?
    !valid?
  end
end
