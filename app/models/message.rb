class Message < ApplicationRecord
  attr_accessor :errored

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true

  def desc_short
    if self.message.length > 70
      return "#{self.message[0..50]}..."
    end

    self.message
  end
end
