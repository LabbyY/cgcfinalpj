class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :artistname
      t.string :avatar
      t.string :country
      t.string :genre
      t.text :introduction

      t.timestamps
    end
  end
end
