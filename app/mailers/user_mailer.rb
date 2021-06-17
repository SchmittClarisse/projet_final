class UserMailer < ApplicationMailer
  def  welcome_email(user) 
    @user  = user 
    mail(to: @user.email, subject: 'Welcome to "Les petites histoires du soir" !' ) 
  end
end
