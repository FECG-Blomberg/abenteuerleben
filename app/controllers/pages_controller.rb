
class PagesController < ApplicationController
  def show
    @page = Page.find_by url: params[:id]
  end
end
