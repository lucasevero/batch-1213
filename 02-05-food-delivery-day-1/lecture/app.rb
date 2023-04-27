require_relative "repositories/patient_repository"
require_relative "repositories/room_repository"

require_relative "controllers/patients_controller"
require_relative "controllers/rooms_controller"

require_relative "router"

patients_csv = File.join(__dir__, "data/patients.csv")
rooms_csv = File.join(__dir__, "data/rooms.csv")

room_repository = RoomRepository.new(rooms_csv)
patient_repository = PatientRepository.new(patients_csv, room_repository)

rooms_controller = RoomsController.new(room_repository)
patients_controller = PatientsController.new(patient_repository)

router = Router.new(patients_controller, rooms_controller)

router.run
