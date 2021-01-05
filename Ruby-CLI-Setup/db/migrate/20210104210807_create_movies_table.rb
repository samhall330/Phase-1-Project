class CreateMoviesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.integer :emoji_rec_id
      
      t.timestamps
    end
  end
end
