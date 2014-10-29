class Artist < ActiveRecord::Base
  belongs_to :user
  before_create :set_photo
  before_create :set_similar
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }  
  validates :user_id, presence: true

  def set_photo
    self.photo ||= "http://i.imgur.com/Ha087R9.jpg"
  end

  def set_similar
    self.similar ||= "No similar artist listed."
  end

end
