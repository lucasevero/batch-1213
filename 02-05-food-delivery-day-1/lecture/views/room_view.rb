class RoomView
  def display_rooms(rooms)
    rooms.each_with_index do |room, room_index|
      puts "Room - #{room_index + 1} (#{room.patients.length}/#{room.capacity})"
      room.patients.each_with_index do |patient, patient_index|
        puts "#{patient_index + 1} - #{patient.name}"
      end
      puts "======================"
    end
  end
end
