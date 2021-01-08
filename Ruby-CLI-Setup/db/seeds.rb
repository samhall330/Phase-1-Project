
Movie.destroy_all
Book.destroy_all
Quote.destroy_all
User.destroy_all
EmojiRec.destroy_all
UserEmoji.destroy_all
UserReview.destroy_all
Movie.reset_pk_sequence
Book.reset_pk_sequence
Quote.reset_pk_sequence
User.reset_pk_sequence
EmojiRec.reset_pk_sequence
UserEmoji.reset_pk_sequence
UserReview.reset_pk_sequence


# 🙄  
emoji_rec1 = EmojiRec.create(emoji_name: ":rolling_eyes:")
# 😫  
emoji_rec2 = EmojiRec.create(emoji_name: ":tired_face:")          
# 😎  
emoji_rec3 = EmojiRec.create(emoji_name: ":sunglasses:")
# 🔥  
emoji_rec4 = EmojiRec.create(emoji_name: ":fire:")
# 😌  
emoji_rec5 = EmojiRec.create(emoji_name: ":satisfied:")
# 😍  
emoji_rec6 = EmojiRec.create(emoji_name: ":heart_eyes:")
# 😭  
emoji_rec7 = EmojiRec.create(emoji_name: ":sob:")

dr_strangelove = Movie.create(title: "Dr. Strangelove", director: "Stanley Kubrick", emoji_rec_id: 1)
parasite = Movie.create(title: "Parasite", director: "Bong Joon-ho", emoji_rec_id: 2)
sunshine = Movie.create(title: "Sunshine", director: "Danny Boyle", emoji_rec_id: 3)
carrie = Movie.create(title: "Carrie", director: "Brian De Palma", emoji_rec_id: 4)
totoro = Movie.create(title: "My Neighbor Totoro", director: "Hayao Miyazaki", emoji_rec_id: 5)
eternal_sunshine = Movie.create(title: "Eternal Sunshine of the Spotless Mind", director: "Michel Gondry", emoji_rec_id: 6)
up = Movie.create(title: "Up", director: "Pete Docter", emoji_rec_id: 7)

catch_twenty_two = Book.create(title: "Catch-22", author: "Joseph Heller", emoji_rec_id: 1)
handmaids_tale = Book.create(title: "The Handmaid's Tale", author: "Margaret Atwood", emoji_rec_id: 2)
on_the_road = Book.create(title: "On the Road", author: "Jack Kerouac", emoji_rec_id: 3)
fahrenheit_fourfiftyone = Book.create(title: "Fahrenheit 451", author: "Ray Bradbury", emoji_rec_id: 4)
the_hobbit = Book.create(title: "The Hobbit", author: "JRR Tolkien", emoji_rec_id: 5)
midsummer = Book.create(title: "A Midsummer Night's Dream", author: "William Shakespeare", emoji_rec_id: 6)
flowers_for_algernon = Book.create(title: "Flowers for Algernon", author: "Daniel Keyes", emoji_rec_id: 7)

quote1 = Quote.create(text: "Life is really simple, but we insist on making it complicated.", author: "Confucius", emoji_rec_id: 1)
quote2 = Quote.create(text: "Life is never fair, and perhaps it is a good thing for most of us that it is not.", author: "Oscar Wilde", emoji_rec_id: 2)
quote3 = Quote.create(text: "Never bend your head. Always hold it high. Look the world straight in the eye.", author: "Helen Keller", emoji_rec_id: 3) 
quote4 = Quote.create(text: "Keep a little fire burning; however small, however hidden.", author: "Cormac McCarthy", emoji_rec_id: 4)
quote5 = Quote.create(text: "Life itself is the most wonderful fairy tale.", author: "Hans Christian Andersen", emoji_rec_id: 5)
quote6 = Quote.create(text: "Love recognizes no barriers. It jumps hurdles, leaps fences, penetrates walls to arrive at its destination full of hope.", author: "Maya Angelou", emoji_rec_id: 6)
quote7 = Quote.create(text: "Life is a long lesson in humility.", author: "James M. Barrie", emoji_rec_id: 7)

## Seed data for testing #
user1 = User.create(username: "samhall")
user2 = User.create(username: "melissafaulner")
user3 = User.create(username: "johnsmith")

#NOTE: a column was added for :recommendation
user_emoji1 = UserEmoji.create(user_id: 1, emoji_rec_id: 1)
user_emoji2 = UserEmoji.create(user_id: 2,emoji_rec_id: 2)
user_emoji3 = UserEmoji.create(user_id: 3, emoji_rec_id: 3)
user_emoji4 = UserEmoji.create(user_id: 2, emoji_rec_id: 3)

user_review1 = UserReview.create(user_id: 1, emoji_rec_id: 1, user_review: "Great!")
user_review2 = UserReview.create(user_id: 2, emoji_rec_id: 2, user_review: "Terrible!")
user_review3 = UserReview.create(user_id: 3, emoji_rec_id: 3, user_review: "Absurd!")
user_review4 = UserReview.create(user_id: 1, emoji_rec_id: 3, user_review: "My mom loves it!")




puts "🔥 🔥  SEEDED 🔥 🔥 "