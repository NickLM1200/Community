class PagesController < ApplicationController
  def home
    @events = Event.where(status: "approved")
      .where(date: Date.today.beginning_of_week..Date.today.end_of_week)
  end
  
  def food
    @organizations = Organization.order(:organizationId) # Replace `organizationID` with the correct column name
  end

  def housing
    @organizations = Organization.order(:organizationId)
  end

  def healthcare
    @organizations = Organization.order(:organizationId)
  end

  def education
    @organizations = Organization.order(:organizationId)
  end

  def childcare
    @organizations = Organization.order(:organizationId)
  end

  def legal_resources
    @organizations = Organization.order(:organizationId)
  end
end