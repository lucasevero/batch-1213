class PatientView
  def ask_for(something)
    puts "Please enter #{something}:"
    gets.chomp
  end

  def display_rooms(rooms)
    puts "Here are all the rooms:"
    rooms.each_with_index do |room, index|
      puts "Room #{index + 1} - #{room.patients.length}/#{room.capacity}"
    end
  end
end
