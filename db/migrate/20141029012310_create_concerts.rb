class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.date :concert_date
      t.string :concert_time
      t.text :performing_artists
      t.string :venue
      t.string :website

      t.timestamps
    end
  end
end
