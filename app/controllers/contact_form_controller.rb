class ContactFormController < ApplicationController
    def create
        contact_params = params.require(:contact_form).permit(:name, :email, :message)
        NotifierMailer.simple_message(contact_params).deliver_now
        flash[:notice] = "Thank you for contacting us, we will get back to you soon."
        redirect_to root_path
    rescue => e
        Rails.logger.error("Contact Form Error: #{e.message}")
        flash[:alert] = "An error occurred while delivering this message. Please try again later."
        redirect_to contactus_path
    end
end
