module ArtistsHelper
  
  def add_to_artists
    link_to "Add to My Artists", artists_path(artist_params), method: :post
  end
  

  def artist_params
    similar_name = @artist["artist"]["similar"].include?("artist") ? @artist["artist"]["similar"]["artist"][0]["name"] : " " 
    
    { artist: {
      name: @artist["artist"]["name"], photo: @artist["artist"]["image"][3]["#text"],
      similar: similar_name 
    } }
  end
end

