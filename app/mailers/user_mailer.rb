class UserMailer < ActionMailer::Base
  default :from => "pativets@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/signin"
    mail(:to => user.email,
         :subject => "Welcome to TimeLine Subscriber's Squad")
  end
  
end
