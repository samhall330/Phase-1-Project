class EmojiRec < ActiveRecord::Base
  has_many :books
  has_many :movies
  has_many :quotes
  has_many :user_emojis
  has_many :users, through: :user_emojis
end
