class MessagesController < ApplicationController
  # TODO: How does the enginer user require authnetication without assuming Devise?
  # before_action :authenticate_user!
  before_action :set_message, only: [:destroy, :edit, :show, :update]

  def index
    @messages = Message.where(account: current_account)
    @new_message = current_user.messages.build
  end

  def show
  end

  def new
    @message = current_user.messages.build
  end

  def create
    @message = Message.new(message_params.merge(account: current_account, user: current_user))
    if @message.save
      @new_message = current_user.messages.build
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
   if @message.update(message_params)
     render @message
   else
     render :edit, status: :unprocessable_entity
   end
  end

  def destroy
    @message.destroy
    render turbo_stream: turbo_stream.remove(@message)
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end