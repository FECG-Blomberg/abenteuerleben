class DownloadsController < ApplicationController
  before_action :set_download, only: %i[ show edit update destroy download ]
  # before_action :admin_only, except: %i[ index download ]

  def index
    # todo: to be removed
    # todo: add key:value database for such stuff
    # @download_page_before = Page.where(url: 'download_before').first!
    # @download_page_after = Page.where(url: 'download_after').first!
    @downloads = Download.where(download_area: true)
  end

  def admin
    @downloads = Download.all
  end

  def show;
    render layout: false
  end

  def new
    @download = Download.new

    render layout: false
  end

  def create
    @download = Download.new(download_params)

    if @download.save
      redirect_to admin_downloads_path(@download), notice: "Download erfolgreich erstellt"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    logger.info 'trying to update download now'

    if @download.update(download_params)
      redirect_to admin_downloads_path, notice: "Download erfolgrech geändert"
    else
      render :show, layout: false, status: :unprocessable_entity
    end
  end

  def destroy
    @download.destroy

    redirect_to downloads_admin_url, notice: "Download was successfully destroyed."
  end

  private

  def set_download
    @download = Download.find(params[:id])
  end

  def download_params
    params.require(:download).permit(:name, :description, :download_area, :file)
  end
end
