class Api::PowderRoomsController < ApplicationController
  
  def index
    powder_rooms = PowderRoom.where(ancestry: nil) # 親のみを取り出す
    render json: powder_rooms
  end

  # リレーションしてるモデル情報も一緒に返す。
  def show
    powder_room = PowderRoom.find(params[:id])
    if powder_room.children == []
      images      = powder_room.images
      detail      = powder_room.detail
      facility    = powder_room.facility

      render json: {
        powder_room: powder_room,
        facility: facility,
        detail: detail,
        images: images,
      }
    else
      children = powder_room.children
      render json: children
    end
  end
end
