class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :photo
      t.string :similar

      t.timestamps
    end
  end
end
