require_relative "../views/room_view"

class RoomsController
  def initialize(room_repository)
    @room_repository = room_repository
    @view = RoomView.new
  end

  def list
    rooms = @room_repository.all
    @view.display_rooms(rooms)
  end

  def move_patient

  end
end
