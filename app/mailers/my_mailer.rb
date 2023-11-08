class MyMailer < ApplicationMailer
    default from: 'udaydas2021@gmail.com'

    def send_email(user)
      @user = user
      # @url  = 'http://example.com/login'
      mail(to: @user.email,
           subject: 'Welcome to My Awesome Site'
          )
    end
  end
  