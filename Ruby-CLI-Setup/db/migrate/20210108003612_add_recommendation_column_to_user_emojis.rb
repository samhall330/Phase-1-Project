class AddRecommendationColumnToUserEmojis < ActiveRecord::Migration[5.2]
  def change
    add_column :user_emojis, :recommendation, :string
  end
end
