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

    render layout: false
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    if valid_captcha && @message.save
      @notice = :success
      @message = Message.new

      render 'new', layout: false
    else
      @notice = :failure
      logger.error 'failed to save message'
      render 'new', layout: false
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
    def valid_captcha
      return true if Rails.env.development?

      verify_hcaptcha(model: @message)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:name, :email, :message, :read)
    end
end
