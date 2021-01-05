class YourAppName
  # here will be your CLI!
  # it is not an AR class so you need to add attr
  attr_reader :prompt
  
  def initialize
    @prompt = TTY::Prompt.new
  end
  
  def run
    welcome
    main_options
  
    # login_or_signup
    # wanna_see_favs?
    # get_joke(what_subject)
  end

  

  private

  def welcome
    puts "Welcome to our app!"
    name = prompt.ask("Please enter your username")
        if User.find_by(username: name)
          puts "Welcome Back #{name}!"
        else 
          User.create(username: name)  
          puts "Welcome, #{name}! Your profile has been created!"
        end
  end

  def main_options
    system 'clear'
    # name.reload
    prompt.select("What do you want to do?") do |menu|
      menu.choice "Get a recommendation", -> { get_recommendation_helper}
      menu.choice "View past recommendations", -> { past_recommendation_helper}
      menu.choice "View past reviews", -> { past_review_helper}
      menu.choice "Exit", -> { exit_helper}
    end
  end

  def get_recommendation_helper

  end

  def past_recommendation_helper
  
  end

  def past_review_helper
  
  end

  def exit_helper

  end

end
