class CreateEmojiRecsTable < ActiveRecord::Migration[5.2]
  def change
      create_table :emoji_recs do |t|
        t.string :emoji_name
        t.integer :book_id
        t.integer :movie_id
        t.integer :quote_id        
  
        t.timestamps
    end
  end
end
