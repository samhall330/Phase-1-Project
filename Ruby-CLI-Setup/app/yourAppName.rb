class YourAppName
  # here will be your CLI!
  # it is not an AR class so you need to add attr
  attr_reader :prompt
  
  def initialize
    @prompt = TTY::Prompt.new
  end
  
  def run
    welcome
  
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




end
