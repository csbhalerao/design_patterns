class GymServiceDecorator
  attr_accessor :cost

  def initialize(room_type)
    @room_type = room_type
  end

  def cost
    @room_type.cost += 500
  end
end