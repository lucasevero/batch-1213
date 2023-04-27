class Room
  attr_reader :capacity, :id, :patients

  def initialize(attr = {})
    @id = attr[:id]
    @capacity = attr[:capacity] || 0
    @patients = attr[:patients] || []
  end

  def full?
    @capacity <= @patients.length
  end

  def available_beds
    @capacity - @patients.length
  end

  def add_patient(patient)
    unless full?
      @patients << patient
      patient.room = self
    end
  end
end
