class User < ActiveRecord::Base
    has_many :user_emojis
    has_many :user_reviews
    has_many :emoji_recs, through: :user_emojis

    def find_emoji_name
        self.emoji_recs.emoji_name
    end
end
