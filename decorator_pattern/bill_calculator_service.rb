require_relative 'dinner_service_decorator'
require_relative 'lunch_service_decorator'
require_relative 'gym_service_decorator'
require_relative 'gold_room_service'
require_relative 'platinum_room_service'

class BillCalculatorService

  def initialize(room_type, service_array)
    @room_type = room_type
    @service_array = service_array
  end

  def calculate_bill
    gold_room if @room_type == 'gold'
    platinum_room if @room_type == 'platinum'
  end

  private

  def gold_room
    gold = GoldRoomService.new
    @service_array.each do |service|
      gold = fetch_decorator(gold, service)
    end

    puts 'gold room price', gold.cost
  end

  def platinum_room
    plt = PlatinumRoomService.new
    @service_array.each do |service|
      plt = fetch_decorator(plt, service)
    end
    puts 'platinum room price', plt.cost
  end

  private

  def fetch_decorator(concrete_class, service)
    concrete_class = GymServiceDecorator.new(concrete_class) if service == 'gym'
    concrete_class = LunchServiceDecorator.new(concrete_class) if service == 'lunch'
    concrete_class = DinnerServiceDecorator.new(concrete_class) if service == 'dinner'
    concrete_class
  end
end

arg1, *SERV = ARGV
services = *SERV.map do |fname|
              fname
            end
BillCalculatorService.new(arg1, services).calculate_bill