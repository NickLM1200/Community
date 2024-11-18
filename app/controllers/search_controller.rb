class SearchController < ApplicationController
  def index
    @query = params[:query].to_s.strip

    # Secure search using ActiveRecord
    if @query.present?
      @organization_results = Organization.where('LOWER(org_name) LIKE LOWER(?) OR LOWER("servicesSummary") LIKE LOWER(?) OR LOWER(city) LIKE LOWER(?) OR LOWER(zipcode::text) LIKE LOWER(?)', "%#{@query}%", "%#{@query}%", "%#{@query}%","%#{@query}%")
      @event_results = Event.where('(LOWER(title) LIKE LOWER(?) OR LOWER("eventDescription") LIKE LOWER(?) OR LOWER(city) LIKE LOWER(?) OR LOWER(zipcode::text) LIKE LOWER(?)) AND eventstatus = ?', "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%", true)
      @results = (@organization_results + @event_results).take(20)
    else
      @results = []
    end
  end
end

