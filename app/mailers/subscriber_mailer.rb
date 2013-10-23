class SubscriberMailer < ActionMailer::Base
  default from: "hello@southdakotacodecamp.net"

  def thanks_email(subscriber)
    @sessions = Session.where(speaker_id: Speaker.where(display: true)).order("created_at DESC")
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: 'Thank you for subscribing')
  end

end
