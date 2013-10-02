class ContactMailer < ActionMailer::Base
  default from: "hello@southdakotacodecamp.net"

  def thanks_email(speaker_submission)
    @speaker_submission = speaker_submission
    mail(to: @speaker_submission.email, subject: 'Submission Recieved')
  end

  def submission_email(speaker_submission)
    @speaker_submission = speaker_submission
    mail(to: 'hello@southdakotacodecamp.net', subject: 'New Speaker Submission')
  end
end
