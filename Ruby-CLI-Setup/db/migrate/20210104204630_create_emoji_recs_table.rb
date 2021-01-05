class CreateEmojiRecsTable < ActiveRecord::Migration[5.2]
  def change
      create_table :emoji_recs do |t|
        t.string :emoji_name     
  
        t.timestamps
    end
  end
end
