# frozen_string_literal: true

class DatePickerComponent < ViewComponent::Base
  def initialize(label:, date:, object:, method:, error_msg:)
    @label = label
    @date = date
    @object = object
    @method = method
    @error_msg = error_msg
  end
end
