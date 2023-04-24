# THE MODEL
# It bares all the STATES and BEHAVVIORS for the unit we are working with

class Task
  attr_reader :content

  def initialize(attr = {})
    @content = attr[:content]
    @completed = attr[:completed] || false
  end

  def mark_as_done!
    @completed = true
  end

  def done?
    @completed
  end
end
