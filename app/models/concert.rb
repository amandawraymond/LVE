class Concert < ActiveRecord::Base
  belongs_to :user
  before_create :set_concert_date
  before_create :set_concert_time
  before_create :set_venue
  before_create :set_website
  
  validates :performing_artists, presence: true 
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


end
