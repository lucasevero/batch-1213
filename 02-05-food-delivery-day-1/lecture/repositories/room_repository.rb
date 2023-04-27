require 'csv'
require_relative "../models/room"

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    load_csv
    @next_id = @rooms.empty? ? 1 : @rooms.size + 1
  end

  def all
    @rooms
  end

  def create(room)
    room.id = @next_id
    @next_id += 1
    @rooms << room
    save_csv
  end

  def find(id)
    @rooms.find do |room|
      room.id == id
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ["id", "capacity"]
      @rooms.each do |room|
        csv << [room.id, room.capacity]
      end
    end
  end
end
