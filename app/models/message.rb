class Message < ApplicationRecord
  attr_accessor :errored
  def desc_short
    if self.message.length > 70
      return "#{self.message[0..50]}..."
    end

    self.message
  end
end
