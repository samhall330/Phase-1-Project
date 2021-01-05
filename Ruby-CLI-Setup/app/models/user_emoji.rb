class UserEmoji < ActiveRecord::Base
  belongs_to :user
  belongs_to :emoji_rec
  has_many :books, through: :emoji_rec
  has_many :movies, through: :emoji_rec
  has_many :quotes, through: :emoji_rec

end
