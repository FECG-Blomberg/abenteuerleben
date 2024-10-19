class Admin::HelperRegistrationsController < ApplicationController
  before_action :set_registration
  before_action :admin_only

  def edit; end

  def update
    logger.info 'going to update registration now'
    @registration.update(params.require(:registration).permit(:wish_first, :wish_second))
    if @registration.errors.any?
      render :edit
    else
      redirect_to helper_path(@registration.helper), notice: 'Anmeldung erfolgreich bearbeitet'
    end
  end

  private
  def set_registration
    @registration = Registration.find_by(id: params[:id])
  end
end
