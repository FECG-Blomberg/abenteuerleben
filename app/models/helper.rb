class Helper < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_one_attached :photo do |photo|
    photo.variant :thumb, resize_to_limit: [256, 256]
    photo.variant :icon, resize_to_limit: [24, 24]
  end

  accepts_nested_attributes_for :registrations, allow_destroy: true, reject_if: :all_blank

  validates :surname, presence: true
  validates :forename, presence: true
  validates :birthday, presence: true
  validates :birthplace, presence: true
  validates :telephone, presence: true
  validates :email, presence: true
  validates :streethouse, presence: true
  validates :postcity, presence: true
  validates :story, presence: true
  validates :photo, presence: { message: 'Bitte ein Foto auswählen' }, on: create

  validate :has_at_least_one_participate
  validate :has_prefered_camp
  validate :camps_are_not_the_same

  attr_accessor :liability_exclusion, :important_information

  def camps_are_not_the_same
    self.registrations.each do |r|
      if r.wish_first == Registration::team_free_value or r.wish_second == Registration::team_free_value
        next
      elsif r.wish_first != r.wish_second
        next
      end

      self.errors.add :duplicate_team, "Camp #{r.camp.name}: Teamwunsch eins und zwei dürfen nicht das gleiche Team sein"
      r.errors.add :duplicate_team, "Teamwunsch eins und zwei dürfen nicht das gleiche Team sein"
    end
  end

  def has_at_least_one_participate
    has_participations = self.registrations.any? { |reg| reg.participate }

    self.errors.add :participation, 'Mindestend ein Camp muss ausgewählt werden' unless has_participations
  end

  def has_prefered_camp
    registration_count = self.registrations.reduce(0) do |sum, r|
      sum += r.participate ? 1 : 0
    end
    return if registration_count < 2

    if self.preferredCamp.blank?
      self.errors.add :preferredCamp, "Bitte ein bevorzugtes Camp bei mehr als eine Campanmeldung angeben"
    end
  end
end
