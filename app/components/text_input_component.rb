# frozen_string_literal: true

class TextInputComponent < ViewComponent::Base
  erb_template <<-ERB
    <div class="text-input <%= @classes unless @classes.blank? %>">
      <label class="text-input__label-wrapper">
        <% unless @no_label %>
          <span class="text-input__label"><%= @label %><%= ' *' if @required %></span>
        <% end %>
        
        <input class="text-input__input" name="<%= @name %> type="text" placeholder="<%= @placeholder %>">
        
        <% unless @error_msg.blank? %>
          <span class="text-input__error"><%= @error_msg %></span>
        <% end %>
      </label>
    </div>
  ERB

  def initialize(label, name, placeholder: '', no_label: false, required: false, dark: false, error_msg: '', classes: '')
    @label = label
    @name = name
    @placeholder = placeholder
    @no_label = no_label
    @required = required
    @dark = dark
    @error_msg = error_msg
    @classes = classes
  end
end
