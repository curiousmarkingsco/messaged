class MessagesController < ApplicationController
  # TODO: How does the enginer user require authnetication without assuming Devise?
  # before_action :authenticate_user!
  before_action :set_message, only: [:destroy, :edit, :show, :update]

  def index
    # TODO: How does the enginer user require authnetication without assuming Devise / ActsAsTenant?
    # @messages = Message.where(account: current_account)
    @messages = Message.all
    # @new_message = current_user.messages.build
    @new_message = Message.new
  end

  def show; end

  def new
    # TODO: How does the enginer user require authnetication without assuming Devise / ActsAsTenant?
    # @message = current_user.messages.build
    @message = Message.new
  end

  def create
    # TODO: How does the enginer user require authnetication without assuming Devise / ActsAsTenant?
    # @message = Message.new(message_params.merge(account: current_account, user: current_user))
    @message = Message.new(message_params)
    if @message.save
      # TODO: How does the enginer user require authnetication without assuming Devise / ActsAsTenant?
      # @new_message = current_user.messages.build
      @new_message = Message.new
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    # TODO: (Security risk) How to authenticate user agnostically?
   if @message.update(message_params)
     render @message
   else
     render :edit, status: :unprocessable_entity
   end
  end

  def destroy
    # TODO: (Security risk) How to authenticate user agnostically?
    @message.destroy
    render turbo_stream: turbo_stream.remove(@message)
  end

  private

  def set_message
    # TODO: (Security risk) How to authenticate user agnostically before declaring?
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end