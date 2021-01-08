
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

the_color_purple = Movie.create(title: "The Color Purple", director: "Steven Spielberg", emoji_rec_id: 1)
frida = Movie.create(title: "Frida", director: "Julie Taymor", emoji_rec_id: 2)
queen_of_katwe= Movie.create(title: "Queen of Katwe", director: "Mira Nair", emoji_rec_id: 3)

the_joy_of_cooking = Book.create(title: "The Joy of Cookiing", author: "Irma Rombauer", emoji_rec_id: 1)
turtles_all_the_way_down = Book.create(title: "Turtles All The Way Down", author: "John Green", emoji_rec_id: 2)
goodbye_stranger = Book.create(title: "Goodbye Stranger", author: "Rebecca Stead", emoji_rec_id: 3)

quote1 = Quote.create(text: "Act as if what you do makes a difference. It does.", author: "William James", emoji_rec_id: 1)
quote2 = Quote.create(text: "Success is not final, failure is not fatal: it is the courage to continue that counts.", author: "Winston Churchill", emoji_rec_id: 2)
quote3 = Quote.create(text: "Never bend your head. Always hold it high. Look the world straight in the eye.", author: "Helen Keller", emoji_rec_id: 3) 

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



# def emoji_hash
#     emoji_hash = {
#       eyeroll: {
#           face: "🙄",
#           book: ["Catch-22", "Joseph Heller"],
#           movie: ["Dr. Strangelove", "Stanley Kubrick"],
#           quote: ["Life is really simple, but we insist on making it complicated.", "Confucius"]
#           },
#       tired: {
#           face: "😫",
#           book: ["The Handmaid's Tale", "Margaret Atwood"],
#           movie: ["Parasite", "Bong Joon-ho"],
#           quote: ["Life is never fair, and perhaps it is a good thing for most of us that it is not.", "Oscar Wilde"]
#           },
#       pensive: {
#           face: "🤔",
#           book: ["Ulysses", "James Joyce"],
#           movie: ["Inception", "Christopher Nolan"],
#           quote: ["That man is wisest who realizes that his wisdom is worthless", "Plato"]
#           },
#       fire: {
#           face: "🔥",
#           book: ["Fahrenheit 451", "Ray Bradbury"],
#           movie: ["Carrie", "Brian De Palma"],
#           quote: ["Keep a little fire burning; however small, however hidden.", "Cormac McCarthy"]
#           },
#       content: {
#           face: "😌",
#           book: ["The Hobbit", "J.R.R Tolkien"],
#           movie: ["My Neighbor Totoro", "Hayao Miyazaki"],
#           quote: ["Life itself is the most wonderful fairy tale.", "Hans Christian Andersen"]
#           },
#       heart_eyes: {
#           face: "😍",
#           book:  ["A Midsummer Night’s Dream", "William Shakespeare"],
#           movie: ["Eternal Sunshine of the Spotless Mind", "Michel Gondry"],
#           quote: ["Love recognizes no barriers. It jumps hurdles, leaps fences, penetrates walls to arrive at its destination full of hope.", "Maya Angelou"]
#           },
#       sob: {
#           face: "😭",
#           book: ["Flowers for Algernon", "Daniel Keyes"],
#           movie: ["Up", "Pete Docter"],
#           quote: ["Life is a long lesson in humility.", "James M. Barrie"]
#           }
#       }
#     end

puts "🔥 🔥 🔥 🔥 "