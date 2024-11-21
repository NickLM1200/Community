class PagesController < ApplicationController
  def home
    @events = Event.where(status: "approved")
      .where(date: Date.today.beginning_of_week..Date.today.end_of_week)
  end
  
  def food
    session[:explore_category] = 'food'
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'FOOD' })
  end

  def housing
    session[:explore_category] = 'housing'
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'HSG' })
  end

  def healthcare
    session[:explore_category] = 'healthcare'
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'HLTH' })
  end

  def education
    session[:explore_category] = 'education'
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'EDU' })
  end

  def childcare
    session[:explore_category] = 'childcare'
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'CHLD' })
  end

  def legal_resources
    session[:explore_category] = 'legal_resources'
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'LEGL' })
  end

  def terms_of_service

  end
  
  def privacy_policy
    
  end

  def show
    # Capture the dynamic page name from the URL
    @page_name = params[:mypage]

    # Special behavior for "survey"
    if @page_name == "survey"
      @questions = Question.all
      render template: "pages/survey"
    else
      # Default behavior: render a dynamic view or raise an error for missing templates
      render template: "pages/#{@page_name}"
    end
  rescue ActionView::MissingTemplate
    render plain: "Page not found", status: :not_found
  end
  
  def survey
    survey = Survey.new
  
    if survey.save
      @survey_service = SurveyService.new(survey.id)
      # Preload data needed for the survey view
      @questions = Question.includes(:answers)
    else
      flash[:error] = "Survey could not be created: #{survey.errors.full_messages.join(", ")}"
      redirect_to root_path # Use a valid path here
    end
  end
end  
