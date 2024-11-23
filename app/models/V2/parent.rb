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
    validates :liability_exclusion, presence: true
    validates :important_information, presence: true
    validates :canceling_info, presence: true
    validates :data_protection, presence: true
    validates :photo_rights, presence: true

    attr_accessor :liability_exclusion
    attr_accessor :important_information
    attr_accessor :canceling_info
    attr_accessor :data_protection
    attr_accessor :photo_rights

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
