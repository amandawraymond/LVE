class Concert < ActiveRecord::Base
  belongs_to :user
  before_create :set_concert_date, :set_concert_time, :set_venue, :set_website,
   :set_location, :set_headliner, :set_performing_artists
    
  
  # validates :performing_artists, presence: true 
  validates :user_id, presence: true

  def set_concert_date
    self.concert_date ||= "23/8/1988".to_date
  end

  def set_concert_time
    self.concert_time ||= "TBD"
  end

  def set_venue
    self.venue ||= "TBD"
  end

  def set_website
    self.website ||= "http://www.last.fm/"
  end

  def set_location
    self.location ||= "OuterSpace"
  end

  def set_headliner
    self.headliner ||= self.performing_artists
  end

  def set_performing_artists
    # binding.pry
    self.performing_artists ||= "no opening acts"
  end


  def self.location(location)

    location = URI.encode(location)
 
    # auth = { query: { api_key: '0cf9f131e6c898341d48bf10b5488916' }} 
    search_url = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=#{location}&limit=50&api_key=0cf9f131e6c898341d48bf10b5488916&format=json"
    # search_url = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=#{location}&format=json"
    response = HTTParty.get search_url
    response["events"]["event"]
  end

  def self.artist(artist)
    
    artist = URI.encode(artist)

    auth = { query: { api_key: '0cf9f131e6c898341d48bf10b5488916' }} 
    search_url = "http://ws.audioscrobbler.com/2.0/?method=artist.getevents&artist=#{artist}&autocorrect[1]&format=json"
    response = HTTParty.get search_url, auth
    response["events"]["event"]
  end

  def self.both(artist, location)  
    
    location = URI.encode(location)
    
    auth = { query: { api_key: '0cf9f131e6c898341d48bf10b5488916' }} 
    search_url = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=#{location}&format=json"
    response = HTTParty.get search_url, auth
    
    response["events"]["event"].select do |event| 
      artists = Array(event["artists"]["artist"]).map { |artist| artist.downcase }
      artists.include?(artist)
    end         
  end

  def self.criteria(artist,location)
    if !artist.blank? && location.blank?
      self.artist(artist)
    elsif artist.blank? && !location.blank?
      self.location(location)
    else
      self.both(artist,location)
    end
  end
      

end
