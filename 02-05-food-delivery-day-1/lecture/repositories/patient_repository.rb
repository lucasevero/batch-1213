require 'csv'
require_relative "../models/patient"

class PatientRepository
  attr_reader :room_repository

  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = []
    load_csv
    @next_id = @patients.empty? ? 1 : @patients.size + 1
  end

  def all
    @patients
  end

  def create(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  def find(id)
    patient.find do |patient|
      patient.id == id
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == "true"
      room = @room_repository.find(row[:room_id].to_i)
      patient = Patient.new(row)
      room.add_patient(patient)
      @patients << patient
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ["id", "name", "cured", "room_id"]
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured, patient.room.id]
      end
    end
  end
end
