# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  erb_template <<-ERB
    <div class="alert alert-<%= @style %>">
      <% unless @icon == nil %>
        <%= forticon @icon, height: 16 %>
      <% end %>

      <%= @text %>
    </div>
  ERB

  def initialize(text:, style:, icon: nil)
    @text = text
    @style = style
    @icon = icon
  end
end
