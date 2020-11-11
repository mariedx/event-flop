class Attendance < ApplicationRecord

  after_create :new_attendance_email

  belongs_to :user
  belongs_to :event

  def new_attendance_email
    event = self.event
    event_admin = event.event_admin
    UserMailer.new_attendance_email(event_admin, event).deliver_now
  end

end
