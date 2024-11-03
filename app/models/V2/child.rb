module V2
  class Child < ApplicationRecord
    belongs_to :parent, :class_name => 'V2::Parent'
    belongs_to :camp

    validates :surname, presence: true
    validates :forename, presence: true
    validates :birthday, presence: true
    validate :birthday_format
    validate :age_approprivate_for_camp
    validates :sex, inclusion: { in: %i[ boy, girl ] }

    attr_accessor :sex
    attr_accessor :surname
    attr_accessor :forename
    attr_accessor :birthday
    attr_accessor :medicals
    attr_accessor :notes
    attr_accessor :wishmate

    def age_approprivate_for_camp
      return if self.errors[:birthday].any?

      bday = Date.parse(self.birthday)
      logger.info 'child year is: ' + bday.year.to_s

      if bday.year > camp.participants_year_end || bday.year < camp.participants_year_start
        self.errors.add('camp_' + self.camp_id.to_s, 'zu alt/jung fuer dieses camp')
      end
    end

    def birthday_format
      return if birthday.nil?

      error = false

      numbers = birthday.split('.')
      logger.info numbers
      error = error || numbers.length != 3

      day = numbers[0].to_i
      error = error || day < 1 || day > 31

      month = numbers[1].to_i
      error = error || month < 1 || month > 12

      year = numbers[2].to_i
      error = error || year < 1000 || year > 9999

      if error
        self.errors.add(:birthday, "muss im format 'dd.mm.yyyy' geschrieben sein")
      end
    end
  end
end
