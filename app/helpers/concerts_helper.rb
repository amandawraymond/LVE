module ConcertsHelper

  def show_date(event)
    event["startDate"].to_date
  end

  def add_to_concerts(event)
    link_to "Add to My Concerts", concerts_path(concert_params(event)), method: :post
  end

  def concert_params(event)
    { concert: { 
      headliner: event["artists"]["headliner"], performing_artists: event["artists"]["artist"].to_s, 
      location: event["venue"]["location"]["city"], venue: event["venue"]["name"], 
      concert_date: event["startDate"].to_date, website: event["url"]
    } }
  end
end