# frozen_string_literal: true

class IconButtonComponent < ViewComponent::Base
  erb_template <<-ERB
    <button class="icon-btn btn <%= @classes %>">
      <%= forticon @icon, height: @height, class: @icon_classes %>
      <span><%= @text %></span>
    </button>
  ERB

  def initialize(icon:, text:, height: 16, classes: '', icon_classes: '')
    @icon = icon
    @text = text
    @height = height
    @classes = classes
    @icon_classes = icon_classes
  end
end
