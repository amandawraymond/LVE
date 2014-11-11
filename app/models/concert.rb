class Concert < ActiveRecord::Base
  belongs_to :user

  before_create :set_defaults

  # validates :performing_artists, presence: true 
  validates :user_id, presence: true

  def set_defaults
    self.concert_date       ||= "23/8/1988".to_date
    self.concert_time       ||= "TBD"
    self.venue              ||= "TBD"
    self.website            ||= "http://www.last.fm/"
    self.location           ||= "OuterSpace"
    self.performing_artists ||= "no opening acts"
    self.headliner          ||= self.performing_artists
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
    return nil                        if artist.blank? && location.blank?
    return self.artist(artist)        if location.blank?
    return self.location(location)    if artist.blank?
    return self.both(artist,location)
  end    

end
