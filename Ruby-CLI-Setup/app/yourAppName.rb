class YourAppName
  # here will be your CLI!
  # it is not an AR class so you need to add attr
  attr_reader :prompt
  
  def initialize
    @prompt = TTY::Prompt.new
  end
  
  def run
    # welcome
    def welcome
      
    end
    # login_or_signup
    # wanna_see_favs?
    # get_joke(what_subject)
  end

  

  private

  
end
