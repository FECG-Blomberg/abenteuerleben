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
    validates :liability_exclusion, acceptance: true
    validates :important_information, acceptance: true
    validates :canceling_info, acceptance: true
    validates :data_protection, acceptance: true
    validates :photo_rights, acceptance: true

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

    def add_child!
      # TODO: test this
      self.children << V2::Child.new
    end

    def unlink_child(index)
      # TODO: test this
      child = self.children[index]
      self.children.delete(child)
    end
  end
end
