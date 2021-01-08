class MoodRec
  
  attr_reader :prompt
  attr_accessor :user

  def initialize
    @prompt = TTY::Prompt.new
  end
  
  def run
    system 'clear'
    welcome
    sleep(2)
    enter_username
    main_options
  end

  def welcome
    puts art
  end

  def art
    puts        
    puts"    
███╗   ███╗ ██████╗  ██████╗ ██████╗  ██████╗ ███████╗ ██████╗
████╗ ████║██╔═══██╗██╔═══██╗██╔══██╗ ██╔══██╗██╔════╝██╔════╝
██╔████╔██║██║   ██║██║   ██║██║  ██║ ██████╔╝█████╗  ██║     
██║╚██╔╝██║██║   ██║██║   ██║██║  ██║ ██╔══██╗██╔══╝  ██║     
██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██████╔╝ ██║  ██║███████╗╚██████╗
╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═════╝  ╚═╝  ╚═╝╚══════╝ ╚═════╝\n".colorize(:cyan)
puts ""
puts "✨✨✨The app that's here for you, no matter your mood✨✨✨"

  end

  def enter_username
    name = prompt.ask("Please enter your username")
        if User.find_by(username: name)
          self.user = User.find_by(username: name)
          puts "Welcome Back, #{name}!"
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
    prompt.select("What would you like to do?") do |menu|
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
    puts "How are you feeling today?"
    sleep(1)
    answer = prompt.ask("Enter an emoji")
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
    var = UserReview.all.select {|user_review| user_review[:user_id] == self.user.id}
    if var.size == 0
      puts "You haven't written any reviews yet"
    else
      puts "You have created #{var.size} review(s)!"
      sleep(1.5)
      # binding.pry
      count = var.size - 1
      until count == -1 do
        emoji = var[count][:emoji_rec_id]
        e = EmojiRec.all.find{|emoji_rec| emoji_rec[:id] == emoji}
        puts str_to_emoji(e[:emoji_name])
        # u = UserEmoji.all.select {|user_emoji| user_emoji[:id] == self.user.id}
        # puts "Recommendation: " + u[count][:recommendation]
        puts "Review: " + var[count][:user_review]
        puts var[count][:created_at].localtime.to_formatted_s(:long)
        puts "************************************************"
        count -= 1
      end
    end
    exit_strategy
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
        sleep(1.5)
        puts "We know that feeling."
        sleep(1.5)
        UserEmoji.create(user_id: self.user.id, emoji_rec_id: emoji_rec_var[0][:id])
      else 
        puts "We don't currently have that in our system"
        sleep(1)
        get_recommendation_helper
      end
    
  end

  def rec_type
    prompt.select("What type of recommendation would you like?") do |menu|
      menu.choice "Book 📚", -> { book_rec }
      menu.choice "Movie 🎬", -> { movie_rec }
      menu.choice "Quote 🎙", -> { quote_rec }
    end
  end

  def book_rec
    system 'clear'
    puts ""
    book_rec_var = Book.all.select{|book_rec_var| book_rec_var[:emoji_rec_id] == UserEmoji.last[:emoji_rec_id]}
    rec = "You should check out '#{book_rec_var[0][:title].colorize(:cyan)}' by #{book_rec_var[0][:author]}"
    puts rec
    puts ""
    sleep(1)
    UserEmoji.last.update(recommendation: rec)
    puts "This recommendation has been saved for you! Yay!"
        prompt.select("Would you rather delete it?") do |menu|
      menu.choice "No thanks! I'll keep it.", -> { review_prompt }
      menu.choice "Yes, delete it please.", -> { destroy_rec}
    end
    #helper method for revie
  end

  def movie_rec
    system 'clear'
    puts ""
    movie_rec_var = Movie.all.select{|movie_rec_var| movie_rec_var[:emoji_rec_id] == UserEmoji.last[:emoji_rec_id]}
    rec = "You should watch '#{movie_rec_var[0][:title].colorize(:cyan)}' by #{movie_rec_var[0][:director]}"
    puts rec
    puts ""
    sleep(1)
    UserEmoji.last.update(recommendation: rec)
    puts "This recommendation has been saved for you! Yay!"
    #helper method for review
    prompt.select("Would you rather delete it?") do |menu|
      menu.choice "No thanks! I'll keep it.", -> { review_prompt }
      menu.choice "Yes, delete it please.", -> { destroy_rec}
    end
  end

  def quote_rec
    system 'clear'
    quote_rec_var = Quote.all.select{|quote_rec_var| quote_rec_var[:emoji_rec_id] == UserEmoji.last[:emoji_rec_id]}
    rec = "'#{quote_rec_var[0][:text].colorize(:cyan)}' -#{quote_rec_var[0][:author]}"
    puts rec
    puts ""
    sleep(1)
    UserEmoji.last.update(recommendation: rec)
    puts "This recommendation has been saved for you! Yay!"
    prompt.select("Would you rather delete it?") do |menu|
      menu.choice "No thanks! I'll keep it.", -> { review_prompt }
      menu.choice "Yes, delete it please.", -> { destroy_rec}
    end
    #helper method for review
  end

  def destroy_rec
    UserEmoji.last.destroy
    exit_strategy
  end

  def review_prompt
    system 'clear'
    prompt.select("Would you like to review this recommendation?") do |menu|
      menu.choice "Yes, I'd like to write a review", -> { create_review }
      menu.choice "No, thanks, take me back to the Main Menu", -> { main_options }
    end    
  end

  def create_review
    # binding.pry
    answer = prompt.ask("Enter your review of this recommendation:")
    puts ""
    puts "Your review: '#{answer}'".colorize(:magenta)
    UserReview.create(user_id: self.user.id, emoji_rec_id: EmojiRec.last.id, user_review: answer)
    puts ""
    sleep (1)
    puts "This review has been saved!"
    sleep (1)
    prompt.select("Would you rather delete it?") do |menu|
      menu.choice "Nope, I'll keep it. Take me back to the Main Menu", -> { main_options }
      menu.choice "Yes, please, and thank you.", -> { destroy_review }
    end
  end

  def destroy_review
    UserReview.last.destroy
    exit_strategy
  end
  
  def exit_strategy
    sleep (1.5)
    prompt.select("Where would you like to go next?") do |menu|
      menu.choice "Main Menu", -> { main_options}
      menu.choice "Exit", -> { exit_helper}
    end
  end


end
