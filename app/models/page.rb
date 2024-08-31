require 'kramdown'

class Page < ApplicationRecord
  validates :url, presence: true
  validates :content, presence: true

  def html
    logger.info 'get the page html by converting it'
    logger.info self.content
    html = Kramdown::Document.new(self.content).to_html
    logger.info html

    html
  end
end
