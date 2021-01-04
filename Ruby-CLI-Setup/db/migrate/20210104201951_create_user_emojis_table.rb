class CreateUserEmojisTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_emojis do |t|
      t.integer :user_id
      t.integer :emoji_rec_id

      t.timestamps
    end
  end
end
