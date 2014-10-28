class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :photo, default: "http://i.imgur.com/Ha087R9.jpg"
      t.string :similar, default: "no similar artist listed"

      t.timestamps
    end
  end
end
