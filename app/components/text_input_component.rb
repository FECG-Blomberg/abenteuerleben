# frozen_string_literal: true

class TextInputComponent < ViewComponent::Base
  erb_template <<-ERB
    <div class="text-input <%= @classes unless @classes.blank? %>">
      <label class="text-input__label-wrapper">
        <% unless @no_label %>
          <span class="text-input__label"><%= @label %><%= ' *' if @required %></span>
        <% end %>
        
        <input class="text-input__input"
               <% unless @value.blank? then %>value="<%= @value %>"<% end %>
               name="<%= @name %>"
               type="text"
               <% unless @placeholder.blank? then %>placeholder="<%= @placeholder %>"><% end %>
        
        <% unless @error_msg.blank? %>
          <span class="text-input__error"><%= @error_msg %></span>
        <% end %>
      </label>
    </div>
  ERB

  def initialize(label, name, value, placeholder: '', no_label: false, required: false, dark: false, error_msg: '', classes: '')
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
