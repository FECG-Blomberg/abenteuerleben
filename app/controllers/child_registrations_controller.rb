class ChildRegistrationsController < ApplicationController
  def index; end

  def new
    @camps = Campyear.active_camp.camps
    @parent = V2::Parent.new
    @parent.children << V2::Child.new
    @parent.children.first.camp_id = 123
  end

  # HTMX endpoint
  def create
    @camps = Campyear.active_camp.camps
    @parent = V2::Parent.new params.require(:v2_parent).permit(
      :surname, :forename,
      :email, :telephone, :housephone,
      :street, :house, :post, :city,
      children_attributes: [ :surname, :forename, :birthday, :notes, :medicals, :wishmate, :camp_id ]
    )

    if params[:commit]
      # TODO put into own method
      if params[:commit] == 'Kind hinzufuegen'
        @parent.children << V2::Child.new
        return render :new
      elsif params[:commit].start_with?('Kind') && params[:commit].end_with?('entfernen')
        index = params[:commit].split(" ")[1].to_i - 1 # frontend does  + 1, backend does - 1
        logger.info 'going to remove child with index... earm: ' + index.to_s
        child = @parent.children[index]
        @parent.children.delete(child)
        return render :new
      end
    end

    @parent.children.each {|child| child.validate }

    if @parent.invalid?
      render :new
    else
      # if header.inlcude htmx
        # header 'hx-redirect'
        # render plain: 'redirect'
      # else
      logger.info @parent.to_json
      redirect_to child_registrations_acknowledge_path
    end
  end

  def acknowledge; end
end
