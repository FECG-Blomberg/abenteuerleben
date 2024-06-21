# frozen_string_literal: true

class TextInputComponent < ViewComponent::Base
  erb_template <<-ERB
    <div class="text-input <%= @classes unless @classes.blank? %>">
      <label class="text-input__label-wrapper">
        <span class="text-input__label"><%= @label %><%= ' *' if @required %></span>
        <input class="text-input__input" name="<%= @name %> type="text">
        <% unless @error_msg.blank? %>
          <span class="text-input__error"><%= @error_msg %></span>
        <% end %>
      </label>
    </div>
  ERB

  def initialize(label, name, required: false, dark: false, error_msg: '', classes: '')
    @label = label
    @name = name
    @required = required
    @dark = dark
    @error_msg = error_msg
    @classes = classes
  end
end
