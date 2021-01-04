class CreateUserReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.integer :user_id
      t.integer :emoji_rec_id
      t.text :user_review

      t.timestamps
    end
  end
end
