
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

  

  private

  def welcome
    puts "Welcome to our app!"
  end

  def enter_username
    sleep(1.5)
    system 'clear'
    name = prompt.ask("Please enter your username")
        if User.find_by(username: name)
          puts "Welcome Back #{name}!"
        else 
          self.user = User.create(username: name)  
          puts "Welcome, #{name}! Your profile has been created!"
          # binding.pry
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
  end

  def past_recommendation_helper
  
  end

  def past_review_helper
  
  end

  def exit_helper

  end

end
