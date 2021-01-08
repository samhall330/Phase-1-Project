class YourAppName
  
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
          # binding.pry
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
      menu.choice "Logout & Start Over", -> { run}
      menu.choice "Exit", -> { exit_helper}
    end
  end

  def get_recommendation_helper
    sleep(1.5)
    system 'clear'
    answer = prompt.ask("How are you feeling today? Enter an emoji.")
    check_symbol(answer)
    rec_type
  end

  def past_recommendation_helper
    system 'clear'
    var = UserEmoji.all.select {|user_emoji| user_emoji[:user_id] == self.user.id}
    if var.size == 0
      puts "You haven't recieved any recommendations yet—go get some!"
    else
      puts "You have recieved #{var.size} recommendations!"
      sleep(1.5)
      count = var.size - 1
      until count == -1 do
        emoji = var[count][:emoji_rec_id]
        r = EmojiRec.all.find{|emoji_rec| emoji_rec[:id] == emoji}
      puts str_to_emoji(r[:emoji_name])
      puts var[count][:recommendation]
      puts var[count][:created_at].localtime.to_formatted_s(:long)
      puts "************************************************"
      count -= 1
      end
    end
    exit_strategy
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

  def emoji_to_str(arg)
    Rumoji.encode(arg) {|emoji| emoji.code}
  end

  def str_to_emoji(arg)
    Rumoji.decode(arg) {|emoji| emoji.code}
  end


  def check_symbol(arg)
    emoji_str = emoji_to_str(arg)
      emoji_rec_var = EmojiRec.all.select {|emoji_rec_var| emoji_rec_var[:emoji_name] == emoji_str}
      if emoji_rec_var
        puts "We know that feeling."
        UserEmoji.create(user_id: self.user.id, emoji_rec_id: emoji_rec_var[0][:id])
      else 
        puts "We don't currently have that in our system"
        get_recommendation_helper
      end

  end

  def rec_type
    prompt.select("What type of recommendation would you like?") do |menu|
      menu.choice "Book", -> { book_rec}
      menu.choice "Movie", -> { movie_rec}
      menu.choice "Quote", -> { quote_rec}
    end
  end

  def book_rec
    book_rec_var = Book.all.select{|book_rec_var| book_rec_var[:emoji_rec_id] == UserEmoji.last[:emoji_rec_id]}
    rec = "You should read #{book_rec_var[0][:title]} by #{book_rec_var[0][:author]}"
    puts rec
    UserEmoji.last.update(recommendation: rec)
    puts "This recommendation has been saved for you! Yay!"
    
    prompt.select("Would you rather delete it?") do |menu|
      menu.choice "Yes, delete it please.", -> { destroy_rec}
      menu.choice "No thanks! I'll keep it.", -> { exit_strategy }
    end
    #helper method for revie
  end

  def movie_rec
    movie_rec_var = Movie.all.select{|movie_rec_var| movie_rec_var[:emoji_rec_id] == UserEmoji.last[:emoji_rec_id]}
    rec = "You should watch #{movie_rec_var[0][:title]} by #{movie_rec_var[0][:director]}"
    puts rec
    UserEmoji.last.update(recommendation: rec)
    #helper method for review
    prompt.select("Would you rather delete it?") do |menu|
      menu.choice "Yes, delete it please.", -> { destroy_rec}
      menu.choice "No thanks! I'll keep it.", -> { exit_strategy }
    end
  end

  def quote_rec
    quote_rec_var = Quote.all.select{|quote_rec_var| quote_rec_var[:emoji_rec_id] == UserEmoji.last[:emoji_rec_id]}
    rec = "#{quote_rec_var[0][:text]} -#{quote_rec_var[0][:author]}"
    puts rec
    UserEmoji.last.update(recommendation: rec)
    prompt.select("Would you rather delete it?") do |menu|
      menu.choice "Yes, delete it please.", -> { destroy_rec}
      menu.choice "No thanks! I'll keep it.", -> { exit_strategy }
    end
    #helper method for review
  end

  def destroy_rec
    UserEmoji.last.destroy
  end
  
  def exit_strategy
    sleep (1.5)
    prompt.select("Where would you like to go next?") do |menu|
      menu.choice "Main Menu", -> { main_options}
      menu.choice "Exit", -> { exit_helper}
    end
  end

end
