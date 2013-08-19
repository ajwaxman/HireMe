class UserMailer < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Welcome to Hire Me!"
  end

  def interview_reminder(interview)
    @interview = interview
    @user = interview.user
    mail to: @user.email, subject: "#{interview.company.name} Interview Reminder!"
  end
end
