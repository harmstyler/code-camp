ActionMailer::Base.smtp_settings = {
  :port           => '25',
  :address        => ENV['POSTMARK_SMTP_SERVER'],
  :user_name      => ENV['POSTMARK_API_KEY'],
  :password       => ENV['POSTMARK_API_KEY'],
  :domain         => 'rocky-peak-3649.herokuapp.com/',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
