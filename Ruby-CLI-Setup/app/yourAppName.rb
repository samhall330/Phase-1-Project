
class YourAppName
  # here will be your CLI!
  # it is not an AR class so you need to add attr
  attr_reader :prompt
  attr_accessor :user
  
  def initialize
    @prompt = TTY::Prompt.new
  end
  
  def run
    welcome
    enter_username
    main_options
  
  end

  

  # private

  def welcome
    puts "Welcome to our app!"
  end

  def enter_username
    sleep(1.5)
    system 'clear'
    name = prompt.ask("Please enter your username")
        if User.find_by(username: name)
          self.user = User.find_by(username: name)
          puts "Welcome Back #{name}!"
          
        else 
          self.user = User.create(username: name)  
          puts "Welcome, #{name}! Your profile has been created!"
          
        end 
  end

  def main_options
    sleep(1.5)
    system 'clear'
    # user.reload
    prompt.select("What do you want to do?") do |menu|
      menu.choice "Get a recommendation", -> { get_recommendation_helper}
      menu.choice "View past recommendations", -> { past_recommendation_helper}
      menu.choice "View past reviews", -> { past_review_helper}
      menu.choice "Exit", -> { exit_helper}
    end
  end

  

  def get_recommendation_helper
    sleep(1.5)
    system 'clear'
    answer = prompt.ask("How are you feeling today? Enter an emoji.")
    #take answer, write helper method that would convert answer to string.
    check_symbol(answer)
    # binding.pry
    # UserEmoji.create(user_id: self.id, emoji_rec_id: )
    rec_type

  end

  def past_recommendation_helper
  
  end

  def past_review_helper
  
  end

  def exit_helper
    sleep (1.5)
    system 'clear'
    puts "✨Thanks for visiting!✨"
    sleep (1.5)
    system 'exit!'
  end

  def check_symbol(arg)
    $emoji_variable = emoji_hash.find do |emoji, emo_hash|
    face_key = emo_hash.select {|key, value| value == arg}
    face_key[:face]
    end
    puts "We know that feeling."
  end

  def rec_type
    prompt.select("What type of recommendation would you like?") do |menu|
      menu.choice "Book", -> { book_rec}
      menu.choice "Movie", -> { movie_rec}
      menu.choice "Quote", -> { quote_rec}
      menu.choice "All three!", -> { allthree_rec}
    end
  end

  def book_rec
    # binding.pry
    book_array = $emoji_variable[1][:book]
    book = book_array[0]
    author = book_array[1]
    puts "You should read #{book} by #{author}"
    #helper method for review
    exit_strategy
  end

  def movie_rec
    movie_array = $emoji_variable[1][:movie]
    movie = movie_array[0]
    director = movie_array[1]
    puts "You should watch #{movie} by #{director}"
    #helper method for review
    exit_strategy
  end

  def quote_rec
    quote_array = $emoji_variable[1][:quote]
    quote = quote_array[0]
    author = quote_array[1]
    puts "#{quote} —#{author}"
    exit_strategy
    #helper method for review
   
  end
  
  def allthree_rec
    # binding.pry
    all_three = $emoji_variable[1]
    book = "You should read #{all_three[:book][0]} by #{all_three[:book][1]}"
    movie = "You should watch #{all_three[:movie][0]} by #{all_three[:movie][1]}"
    quote = "#{all_three[:quote][0]} by #{all_three[:quote][1]}"
  
    puts book
    puts movie
    puts quote

    exit_strategy
    
  end

  def exit_strategy
    sleep (1.5)
    prompt.select("Where would you like to go next?") do |menu|
      menu.choice "Main Menu", -> { main_options}
      menu.choice "Exit", -> { exit_helper}
    end
  end

  # private
  def emoji_hash
  emoji_hash = {
    eyeroll: {
        face: "🙄",
        book: ["Catch-22", "Joseph Heller"],
        movie: ["Dr. Strangelove", "Stanley Kubrick"],
        quote: ["Life is really simple, but we insist on making it complicated.", "Confucius"]
        },
    tired: {
        face: "😫",
        book: ["The Handmaid's Tale", "Margaret Atwood"],
        movie: ["Parasite", "Bong Joon-ho"],
        quote: ["Life is never fair, and perhaps it is a good thing for most of us that it is not.", "Oscar Wilde"]
        },
    pensive: {
        face: "🤔",
        book: ["Ulysses", "James Joyce"],
        movie: ["Inception", "Christopher Nolan"],
        quote: ["That man is wisest who realizes that his wisdom is worthless", "Plato"]
        },
    fire: {
        face: "🔥",
        book: ["Fahrenheit 451", "Ray Bradbury"],
        movie: ["Carrie", "Brian De Palma"],
        quote: ["Keep a little fire burning; however small, however hidden.", "Cormac McCarthy"]
        },
    content: {
        face: "😌",
        book: ["The Hobbit", "J.R.R Tolkien"],
        movie: ["My Neighbor Totoro", "Hayao Miyazaki"],
        quote: ["Life itself is the most wonderful fairy tale.", "Hans Christian Andersen"]
        },
    heart_eyes: {
        face: "😍",
        book:  ["A Midsummer Night’s Dream", "William Shakespeare"],
        movie: ["Eternal Sunshine of the Spotless Mind", "Michel Gondry"],
        quote: ["Love recognizes no barriers. It jumps hurdles, leaps fences, penetrates walls to arrive at its destination full of hope.", "Maya Angelou"]
        },
    sob: {
        face: "😭",
        book: ["Flowers for Algernon", "Daniel Keyes"],
        movie: ["Up", "Pete Docter"],
        quote: ["Life is a long lesson in humility.", "James M. Barrie"]
        }
    }
  end
  
end
