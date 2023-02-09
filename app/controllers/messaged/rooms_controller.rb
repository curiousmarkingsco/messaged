module Messaged
  class RoomsController < ApplicationController
    # User should be authenticated by main.app
    before_action :set_room, only: [:destroy, :edit, :show, :update]

    def index
      @rooms = Room.all
    end

    def show
      @new_message = Message.new
      return unless messaged_current_owner && messaged_current_owner.class != Messaged::NullUser
      @new_message = messaged_current_owner.messages.build
    end

    def new
      @room = Room.new
      @recipient = Messaged.user_class.find(params[:recipient]) if params.dig(:recipient)
      return unless messaged_current_owner && messaged_current_owner.class != Messaged::NullUser
      @room = messaged_current_owner.rooms.build
    end

    def create
      @room = Room.new(room_params)
      if @room.save
        respond_to do |format|
          format.html { redirect_to @room }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @room.update(room_params)
        render @room
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @room.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@room) }
        format.html         { redirect_to rooms_url }
      end
    end

    private

    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:title, :user_id, :tenant_id, :recipient_id)
    end
  end
end