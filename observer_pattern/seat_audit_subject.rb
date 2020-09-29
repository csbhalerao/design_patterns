class SeatAuditSubject
  def initialize
    @waiting_list = 50
    @observers = []
  end

  def register_observers(observer)
    @observers << observer
  end

  def remove_observers(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(@waiting_list)
    end
  end

  def update_waiting_list(number)
    @waiting_list -= number
    notify_observers
  end
end
