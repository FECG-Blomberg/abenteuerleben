class ChildRegistrationsController < ApplicationController
  def index; end

  def new
    @camps = Campyear.active_camp.camps
    @parent = V2::Parent.new
    @parent.children << V2::Child.new

    @page_liability = Page.where(url: 'eltern_haftungsausschluss').first&.content || ''
    @page_important_info =  Page.where(url: 'eltern_wichtige-informationen').first&.content || ''
    @page_cancel_rules = Page.where(url: 'stornierungsregeln').first&.content || ''
  end

  # HTMX endpoint
  def create
    @camps = Campyear.active_camp.camps
    @parent = V2::Parent.new parent_child_params

    # special commands
    if params[:commit]
      # add child
      @parent.add_new_child! if add_child_command
      # remove child
      @parent.unlink_child(params[:commit].split(' ')[1].to_i - 1) if remove_child_command

      return render :new
    end

    # validate
    @parent.children.each { |child| child.validate }
    if @parent.invalid?
      return render :new
    end

    # saving
    @parent.save
    @parent.children.each do |child|
      child.save
      ChildRegistrationMailer.with(parent: @parent, child: child).registered_mail.deliver_later
    end

    # htmx handler
    if request.headers.key? 'Hx-Request'
      response.add_header 'HX-Redirect', child_registrations_acknowledge_path
      return render plain: 'redirecting...'
    end

    # normal handler
    redirect_to child_registrations_acknowledge_path
  end

  def acknowledge; end

  private
  def parent_child_params
    params.require(:v2_parent).permit(
      :surname, :forename,
      :email, :telephone, :housephone,
      :street, :house, :post, :city,
      :liability_exclusion,
      :important_information,
      :canceling_info,
      :data_protection,
      :photo_rights,
      children_attributes: [
        :surname, :forename,
        :sex, :birthday,
        :notes, :medicals,
        :wishmate, :camp_id
      ]
    )
  end

  def add_child_command
    params[:commit] == 'add-child'
  end

  def remove_child_command
    params[:commit].start_with?('Kind') && params[:commit].end_with?('entfernen')
  end
end
