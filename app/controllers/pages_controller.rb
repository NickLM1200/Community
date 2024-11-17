class PagesController < ApplicationController
  def home
    @events = Event.where(status: "approved")
      .where(date: Date.today.beginning_of_week..Date.today.end_of_week)
  end
  
  def food
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'FOOD' })
  end

  def housing
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'HSG' })
  end

  def healthcare
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'HLTH' })
  end

  def education
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'EDU' })
  end

  def childcare
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'CHLD' })
  end

  def legal_resources
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'LEGL' })
  end
end