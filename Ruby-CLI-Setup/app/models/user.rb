class User < ActiveRecord::Base
    has_many :user_emojis
    has_many :user_reviews
    has_many :emoji_recs, through: :user_emojis

    def store_all_recs(par)
        arr = []
        arr << par
    end

end

