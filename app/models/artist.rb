class Artist < ActiveRecord::Base
  belongs_to :user
  before_create :set_photo, :set_similar
  
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }  
  validates :user_id, presence: true

  def set_photo
    self.photo ||= "http://i.imgur.com/Ha087R9.jpg?3"
  end

  def set_similar
    self.similar ||= "No similar artist listed."
  end

  def self.artist_info(artist)
    artist = URI.encode(artist)
    search_url = "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{artist}&autocorrect[1]&api_key=0cf9f131e6c898341d48bf10b5488916&format=json"
    response = HTTParty.get search_url
    response
  end

end
