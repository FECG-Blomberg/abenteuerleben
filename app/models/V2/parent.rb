module V2
  class Parent < ApplicationRecord
    has_many :children, class_name: 'V2::Child'
    accepts_nested_attributes_for :children

    validates :children, presence: true
    validates :surname, presence: true
    validates :forename, presence: true
    validates :telephone, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :street, presence: true
    validates :house, presence: true
    validates :post, presence: true
    validates :city, presence: true

    # attr_accessor :surname
    # attr_accessor :forename
    # attr_accessor :telephone
    # attr_accessor :housephone
    # attr_accessor :email
    # attr_accessor :street
    # attr_accessor :house
    # attr_accessor :post
    # attr_accessor :city
  end
end
