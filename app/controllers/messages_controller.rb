class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :admin_only, except: %i[ new create ]

  # GET /messages or /messages.json
  def index
    @messages = Message.all.order(id: :desc)
  end

  # GET /messages/1 or /messages/1.json
  def show
    @message.read = true
    @message.save
  end

  # GET /messages/new
  def new
    # this route should not exist?
    @message = Message.new

    render :'messages/new', layout: nil
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    unless ENV['RAILS_ENV'] == 'development' || ENV['RAILS_ENV'] == 'test'
      unless verify_hcaptcha(model: @message)
        @message.validate
        render 'messages/new', layout: nil
        return
      end
    end

    if @message.save
      render plain: '<p style="text-align: center; color: green; border: 1px solid green; padding: 4px;">Erfolgreich abgeschickt</p>'
    else
      flash[:message] = @message
      flash[:notice] = 'Fehler beim abschicken der Nachricht. Bitte erneut versuchen.'
      flash[:error] = true

      render 'messages/new', layout: nil
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    if @message.update(message_params)
      redirect_to message_url(@message), notice: "Nachricht erfolgreich geändert."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    redirect_to messages_path, notice: "Nachricht erfolgreich gelöscht."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:name, :email, :message, :read)
    end
end
