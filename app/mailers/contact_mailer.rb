class ContactMailer < ActionMailer::Base
  default from: "hello@southdakotacodecamp.net"

  def thanks_email(speaker_submission)
    @speaker_submission = speaker_submission
    mail(to: @speaker_submission.email, subject: 'Submission Recieved')
  end

  def submission_email(speaker_submission)
    @speaker_submission = speaker_submission
    mail(to: 'tyler.harms@gmail.com', subject: 'New Speaker Submission')
  end
end
