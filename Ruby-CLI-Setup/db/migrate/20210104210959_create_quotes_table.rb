class CreateQuotesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.text :text
      t.string :author
      t.integer :emoji_rec_id

      t.timestamps
    end
  end
end
