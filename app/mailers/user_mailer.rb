class UserMailer < ApplicationMailer
    def password_reset(user, token)
        @user = user
        @token = token
        mail to: user.email, subject: "Password Reset Instructions"
    end
end
