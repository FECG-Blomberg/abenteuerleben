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
    @classes = (style_classes + ' ' + classes).strip
  end

  def style_classes
    case @style
    when 'primary'
      return 'btn-primary'
    when 'secondary'
      return 'btn-secondary'
    else
      return ''
    end
  end

end
