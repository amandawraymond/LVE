class Artist < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, uniqueness: { case_sensitive: false }  
  validates :user_id, presence: true
end
