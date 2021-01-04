
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


the_color_purple = Movie.create(
    title: "The Color Purple",
    director: "Steven Spielberg")

frida = Movie.create(
            title: "Frida",
            director: "Julie Taymor")

queen_of_katwe= Movie.create(
            title: "Queen of Katwe",
            director: "Mira Nair")

the_joy_of_cooking = Book.create(
            title: "The Joy of Cookiing",
            author: "Irma Rombauer")

turtles_all_the_way_down = Book.create(
            title: "Turtles All The Way Down",
            author: "John Green")

goodbye_stranger = Book.create(
            title: "Goodbye Stranger",
            author: "Rebecca Stead")

quote1 = Quote.create(
            text: "Act as if what you do makes a difference. It does.",
            author: "William James")


quote2 = Quote.create(
            text: "Success is not final, failure is not fatal: it is the courage to continue that counts.",
            author: "Winston Churchill")

quote3 = Quote.create(
            text: "Never bend your head. Always hold it high. Look the world straight in the eye.",
            author: "Helen Keller") 

user1 = User.create(
            username: "samhall")

user2 = User.create(
            username: "melissafaulner")

user3 = User.create(
            username: "johnsmith")

emoji_rec1 = EmojiRec.create(
            emoji_name: "winking face",
            book_id: the_joy_of_cooking.id,
            movie_id: 1,
            quote_id: 1)

emoji_rec2 = EmojiRec.create(
            emoji_name: "grinning face",
            book_id: 2,
            movie_id: 2,
            quote_id: 2)
            
emoji_rec3 = EmojiRec.create(
            emoji_name: "sleepy face",
            book_id: 3,
            movie_id: 3,
            quote_id: 3)

user_emoji1 = UserEmoji.create(
            user_id: 1,
            emoji_rec_id: 1)

user_emoji2 = UserEmoji.create(
            user_id: 2,
            emoji_rec_id: 2)

user_emoji3 = UserEmoji.create(
            user_id: 3,
            emoji_rec_id: 3)

user_emoji4 = UserEmoji.create(
                user_id: 2,
                emoji_rec_id: 3)

user_review1 = UserReview.create(
                user_id: 1,
                emoji_rec_id: 1,
                user_review: "Great!")

user_review2 = UserReview.create(
                user_id: 2,
                emoji_rec_id: 2,
                user_review: "Terrible!")

user_review3 = UserReview.create(
                user_id: 3,
                emoji_rec_id: 3,
                user_review: "Absurd!")

user_review4 = UserReview.create(
                    user_id: 1,
                    emoji_rec_id: 3,
                    user_review: "My mom loves it!")
           

# ########### different ways to write your seeds ############


# # 1: save everything to variables (makes it easy to connect models, best for when you want to be intentional about your seeds)
# # basil = Plant.create(name: "basil the herb", bought: 20200610, color: "green")
# # sylwia = Person.create(name: "Sylwia", free_time: "none", age: 30)
# # pp1 = PlantParenthood.create(plant_id: basil.id, person_id: sylwia.id, affection: 1_000_000, favorite?: true)

# # 2. Mass create -- in order to connect them later IN SEEDS (not through the app) you'll need to find their id
# ## a. by passing an array of hashes:







# Plant.create([
#     {name: "Corn Tree", bought: 20170203, color: "green"},
#     {name: "Prayer plant", bought: 20190815, color: "purple"},
#     {name: "Cactus", bought: 20200110, color: "ugly green"}
# ])
# ## b. by interating over an array of hashes:
# plants = [{name: "Elephant bush", bought: 20180908, color: "green"},
#     {name: "Photos", bought: 20170910, color: "green"},
#     {name: "Dragon tree", bought: 20170910, color: "green"},
#     {name: "Snake plant", bought: 20170910, color: "dark green"},
#     {name: "polka dot plant", bought: 20170915, color: "pink and green"},
#     {name: "Cactus", bought: 20200517, color: "green"}]

# plants.each{|hash| Plant.create(hash)}






# # 3. Use Faker and mass create
# ## step 1: write a method that creates a person
# def create_person
#     free = ["mornings", "evenings", "always", "afternoons", "weekends", "none"].sample

#     person = Person.create(
#         name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
#         free_time: free,
#         age: rand(11...70)
#     )
# end

# ## step 2: write a method that creates a joiner
# def create_joiners(person)
#     plants_number = rand(1..4)
#     plants_number.times do 
#         PlantParenthood.create(
#             plant_id: Plant.all.sample.id, 
#             person_id: person.id, 
#             affection: rand(101), 
#             favorite?: [true, false].sample
#         )
#     end
# end

# ## step 3: invoke creating joiners by passing in an instance of a person
# 10.times do     
#     create_joiners(create_person)
#     ##### ALTERNATIVE:
#     # person = create_person
#     # create_joiners(person)
# end

# indoor = Category.create(name: "indoors")

# Plant.update(category_id: indoor.id)


puts "🔥 🔥 🔥 🔥 "