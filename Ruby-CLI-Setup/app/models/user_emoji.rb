class User_Emoji < ActiveRecord::Base
  belongs_to :user
  belongs_to :emoji_rec
end
