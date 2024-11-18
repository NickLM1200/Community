class UserOrganizationsController < ApplicationController
    def show
        @organization = Organization.find(params[:id])
    end
end
