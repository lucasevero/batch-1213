require_relative "../views/patient_view"

class PatientsController
  def initialize(patient_repository)
    @patient_repository = patient_repository
    @view = PatientView.new
  end

  def add
    name = @view.ask_for("the name of the patient")
    rooms = @patient_repository.room_repository.all
    @view.display_rooms(rooms)
    room_index = @view.ask_for("the number of the patient's room").to_i - 1
    patient = Patient.new(name: name)
    room = rooms[room_index]
    room.add_patient(patient)
    @patient_repository.create(patient)
  end

  def check_out

  end
end
