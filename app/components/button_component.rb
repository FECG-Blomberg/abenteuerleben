# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  erb_template <<-ERB
    <button class="btn <%=  @classes %>">
      <%= @text %>
    </button>
  ERB

  def initialize(text, style: '', type: '', classes: '')
    @text = text
    @type = type
    @style = style
    @classes = (classes + style_classes).strip
  end

  def style_classes
    case @style
    when 'primary'
      return 'btn-primary'
    else
      return ''
    end
  end

end
