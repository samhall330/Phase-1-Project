class CreateBooksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :emoji_rec_id
    
      t.timestamps
    end
  end
end
