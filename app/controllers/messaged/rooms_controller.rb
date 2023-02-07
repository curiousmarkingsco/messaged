module Messaged
  class RoomsController < ApplicationController
    # User should be authenticated by main.app
    before_action :set_room, only: [:destroy, :edit, :show, :update]

    def index
      @rooms = Room.all
      @new_room = Room.new
      return unless messaged_current_owner && messaged_current_owner.class != Messaged::NullUser
      @new_room = messaged_current_owner.rooms.build
    end

    def show; end

    def new
      @room = Room.new
      return unless messaged_current_owner && messaged_current_owner.class != Messaged::NullUser
      @room = messaged_current_owner.rooms.build
    end

    def create
      @room = Room.new(room_params)
      if @room.save
        if messaged_current_owner && messaged_current_owner.class != Messaged::NullUser
          @new_room = messaged_current_owner.rooms.build
        end
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.append(:rooms, partial: "messaged/rooms/room",
              locals: { room: @room })
          end
          format.html { redirect_to rooms_url }
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
      params.require(:room).permit(:content, :user_id, :tenant_id, :messaged_room_id)
    end
  end
end