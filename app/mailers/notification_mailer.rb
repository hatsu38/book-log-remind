class NotificationMailer < ApplicationMailer
  default from: 'hajiwata0308@gmail.com'

  def remind(account, books)
    @account = account
    @books = books
    mail(
      to: 'hajiwata0308@gmail.com',
      from: "<hajiwata0308@gmail.com>",
      subject: "[#{Rails.env}] [Book Log Remind] #{books.first.title}"
    )
  end
end
