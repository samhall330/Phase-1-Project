
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
    #return to menu or exit_helper?
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
        book: ["Turtles All the Way Down", "John Greene"],
        movie: ["Sabrina", "Director"],
        quote: ["Look up!", "Author"]
        },
    tired: {
        face: "😫",
        book: ["Carry On", "Rainbow Rowell"],
        movie: ["Shaun of the Dead", "Edgar Wright"],
        quote: ["Life's a bitch", "Author"]
        },
    pensive: {
        face: "🤔",
        book: ["Goodbye Stranger", "Rebecca Stead"],
        movie: ["Inception", "Christopher Nolan"],
        quote: ["Something profound", "Author"]
        },
    fire: {
        face: "🔥",
        book: "",
        movie: "",
        quote: ""
        },
    content: {
        face: "😌",
        book: "",
        movie: "",
        quote: ""
        },
    heart_eyes: {
        face: "😍",
        book: "",
        movie: "",
        quote: ""
        },
    sob: {
        face: "😭",
        book: "",
        movie: "",
        quote: ""
        }
    }
  end
  
end
