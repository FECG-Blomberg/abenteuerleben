class GalleryController < ApplicationController
  def index
  end

  def file
    logger.info params[:file]

    file = Rails.cache.fetch("gallery_image/#{params[:file]}", expires_in: 5.minutes) do
      Gallery.get_file(params[:file])
    end
    type = "image/#{File.extname(params[:file].to_s)[1..]}"
    filename = params[:file]

    send_data file, filename:, type:
  end
end
