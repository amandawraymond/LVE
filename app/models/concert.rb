class Concert < ActiveRecord::Base
  belongs_to :user
  before_create :set_concert_date
  before_create :set_concert_time
  before_create :set_venue
  before_create :set_website
  before_create :set_location
  before_create :set_headliner
  
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


  def self.location(location=nil)
    auth = { query: { api_key: '0cf9f131e6c898341d48bf10b5488916' }} 
    search_url = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=#{location}&format=json"
    response = HTTParty.get search_url, auth
    # response["events"]["event"]
  end

  def self.artist(artist=nil)
   
    auth = { query: { api_key: '0cf9f131e6c898341d48bf10b5488916' }} 
    search_url = "http://ws.audioscrobbler.com/2.0/?method=artist.getevents&artist=#{artist}&format=json"
    response = HTTParty.get search_url, auth
    # response["events"]["event"]
  end

  def self.both(location=nil, artist=nil )
    location ||= "united states"
    artist ||= "pretty lights"

    auth = { query: { api_key: '0cf9f131e6c898341d48bf10b5488916' }} 
    search_url = "http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=#{location}&format=json"
    response = HTTParty.get search_url, auth
    
    response["events"]["event"].select do |event| 
      event["artists"]["artist"][0].include?(artist)
    end         
  end

  def self.criteria(artist=nil,location=nil)
    if artist && !location
      self.artist(artist)
    elsif !artist && location
      self.location(location)
    else
      self.both(artist,location)
    end
  end
      

end
