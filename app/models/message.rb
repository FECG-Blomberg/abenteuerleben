class Message < ApplicationRecord
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true

  def desc_short
    if self.message.length > 30
      return "#{self.message[0..30]}..."
    end

    self.message
  end
end
