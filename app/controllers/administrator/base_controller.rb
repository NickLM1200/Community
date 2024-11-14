module Administrator
  class BaseController < ApplicationController
    helper_method :admin_logged_in?

    include Administrator::AdminsHelper
    include Administrator::CategoriesHelper
    include Administrator::ClassificationsHelper
    include Administrator::OrganizationsHelper

    def set_current_admin
      if session[:admin_username]
        Current.admin = Admin.find_by(username: session[:admin_username])
      else
        redirect_to adminaccess_path
      end
    end

    private
    
    def admin_logged_in?
      session[:admin_username].present?
    end

  end
end