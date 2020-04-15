namespace :send_mail do
  desc '読んだ本をリマインドする'
  task :book_remind_mail, [:span_days] => :environment do |_, args|
    Book.where(updated_at: args.span_days)
    before_day = args.span_days.to_i
    span = Date.today - before_day.days
    books = Book.where(updated_at: span.all_day)
    NotificationMailer.remind(books).deliver
  end
end
