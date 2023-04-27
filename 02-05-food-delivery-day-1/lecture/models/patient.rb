class Patient
  attr_reader :name, :cured
  attr_accessor :room, :id

  def initialize(attr = {})
    # attr => {
    #   name: "Luca",
    #   cured: true
    # }
    @id = attr[:id]
    @name = attr[:name]
    @cured = attr[:cured] || false
    @room = attr[:room]
  end

  def cure!
    @cured = true
  end
end

Patient.new(name: "luca")
