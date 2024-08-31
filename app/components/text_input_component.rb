class TextInputComponent < ViewComponent::Base

  def initialize(
    label,
    name,
    value,
    placeholder: '',
    no_label: false,
    required: false,
    dark: false,
    error_msg: '',
    classes: '',
    type: :input
  )
    @type = type
    @label = label
    @name = name
    @value = value
    @placeholder = placeholder
    @no_label = no_label
    @required = required
    @dark = dark
    @error_msg = error_msg
    @classes = classes
  end
end
