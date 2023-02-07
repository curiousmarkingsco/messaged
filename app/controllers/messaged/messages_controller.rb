module Messaged
  class MessagesController < ApplicationController
    # User should be authenticated by main.app
    before_action :set_message, only: [:destroy, :edit, :show, :update]

    def index
      # TODO: How does the enginer user require authnetication without assuming Devise / ActsAsTenant?
      # @messages = Message.where(account: current_account)
      @messages = Message.all
      @new_message = Message.new
      return unless messaged_current_owner && messaged_current_owner.class != Messaged::NullUser
      @new_message = messaged_current_owner.messages.build
    end

    def show; end

    def new
      @message = Message.new
      return unless messaged_current_owner && messaged_current_owner.class != Messaged::NullUser
      @message = messaged_current_owner.messages.build
    end

    def create
      # TODO: How does the enginer user require authnetication without assuming Devise / ActsAsTenant?
      # @message = Message.new(message_params.merge(account: current_account, user: current_user))
      @message = Message.new(message_params)
      if @message.save
        if messaged_current_owner && messaged_current_owner.class != Messaged::NullUser
          @new_message = messaged_current_owner.messages.build
        end
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.append(:messages, partial: "messaged/messages/message",
              locals: { message: @message })
          end
          format.html { redirect_to messages_url }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
    if @message.update(message_params)
      render @message
    else
      render :edit, status: :unprocessable_entity
    end
    end

    def destroy
      @message.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@message) }
        format.html         { redirect_to messages_url }
      end
    end

    private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content, :user_id, :tenant_id, :messaged_room_id)
    end
  end
end