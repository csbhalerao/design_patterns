require_relative 'seat_audit_subject'
require_relative 'website_dashboard_observer'
require_relative 'notification_observer'

class WaitingListService
  def initialize
    @seat_audit_subject = SeatAuditSubject.new
    @site_observer = WebsiteDashboardObserver.new
    @notification_observer = NotificationObserver.new
    @seat_audit_subject.register_observers(@site_observer)
    @seat_audit_subject.register_observers(@notification_observer)
  end

  def update(number)
    @seat_audit_subject.update_waiting_list(number)
  end

  def unregister_site
    @seat_audit_subject.remove_observers(@site_observer)
  end

  def unregister_notification
    @seat_audit_subject.remove_observers(@notification_observer)
  end
end

ARGV.each { |number|
  number = number.to_i
  w = WaitingListService.new
  i = 5
  while i <= 15 do
    w.update(number)
    i += 5
    puts '---------------------------------------'
    sleep(2)
  end


}
