class NotifierMailer < ApplicationMailer
   def simple_message(contact_params)
         @contact = contact_params   
       mail(
        to: 'community.colorado.nextgen@gmail.com',
        from: @contact[:email],
        subject: "New Contact Form Submission from #{@contact[:name]}"
       )
   end
end
