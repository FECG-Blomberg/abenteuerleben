module Parent
  class Parent < ApplicationRecord
    has_many :children

    # base
    validates :surname, presence: true
    validates :forename, presence: true

    # address
    validates :street, presence: true
    validates :house, presence: true
    validates :post, presence: true
    validates :city, presence: true

    # contact
    validates :telephone, presence: true
    validates :email, presence: true

    def wa_telephone
      whatsapp_format telephone
    end

    def wa_housephone
      whatsapp_format housephone
    end

    def whatsapp_format number
      trimmed = number.strip.gsub(" ", "")
      first_two = trimmed[0..1]

      return "49" + trimmed[1..] if first_two[0] == "0"
      return "49" + trimmed[3..] if first_two == "+4"
      return trimmed[1..2] + trimmed[3..] if first_two[0] == "+"
      trimmed
    end
  end
end
