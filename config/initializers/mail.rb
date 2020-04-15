ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: Rails.application.credentials.gmail_address || ENV["GMAIL_ADDRESS"] || '',
  password: Rails.application.credentials.gmail_password || ENV["GMAIL_PASSWORD"] || '',
  authentication: :login,
  enable_starttls_auto: true
}