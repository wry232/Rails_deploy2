class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.integer :times

      t.timestamps
    end
  end
end
