class ChildRegistrationsController < ApplicationController
  def index; end

  def new
    @camps = Campyear.active_camp.camps
    @parent = V2::Parent.new
    @parent.children << V2::Child.new
    @parent.children.first.camp_id = 123

    @page_liability = Page.where(url: 'eltern_haftungsausschluss').first&.content || ''
    @page_important_info =  Page.where(url: 'eltern_wichtige-informationen').first&.content || ''
    @page_cancle_rules = Page.where(url: 'stornierungsregeln').first&.content || ''
  end

  # HTMX endpoint
  def create
    @camps = Campyear.active_camp.camps
    @parent = V2::Parent.new params.require(:v2_parent).permit(
      :surname, :forename,
      :email, :telephone, :housephone,
      :street, :house, :post, :city,
      children_attributes: [ :surname, :forename, :sex, :birthday, :notes, :medicals, :wishmate, :camp_id ]
    )

    if params[:commit]
      # TODO put into own method
      if params[:commit] == 'Kind hinzufuegen'
        @parent.children << V2::Child.new
        return render :new
      elsif params[:commit].start_with?('Kind') && params[:commit].end_with?('entfernen')
        index = params[:commit].split(" ")[1].to_i - 1 # frontend does  + 1, backend does - 1
        child = @parent.children[index]
        @parent.children.delete(child)
        return render :new
      end
    end

    @parent.children.each { |child| child.validate }

    if @parent.invalid?
      logger.info "#{@parent.to_json} is invalid: #{@parent.errors.full_messages.to_json}"
      return render :new
    end

    @parent.save

    @parent.children.each do |child|
      child.save
      ChildRegistrationMailer.with(parent: @parent, child: child).registered_mail.deliver_later
    end

    if request.headers.key? 'Hx-Request'
      response.add_header 'HX-Redirect', child_registrations_acknowledge_path
      return render plain: 'redirecting...'
    end

    redirect_to child_registrations_acknowledge_path
  end

  def acknowledge; end
end
