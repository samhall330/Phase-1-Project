class User < ActiveRecord::Base
    has_many :user_emojis
    has_many :user_reviews
    has_many :emoji_recs, through: :user_emojis

end
