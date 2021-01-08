
✨Welcome to 'MoodRec'✨

MoodRec is a CLI interface that allows users to input how they're feeling with an emoji, and then recieve recommendations based off they're input. Users can determine whether they'd like a 'book,' 'movie,' or 'inspirational quote' recommendation. 

After recieving their recommendation, they can save it and review it. Users then have the ability to see all of their past emoji, recommendations, and reviews.

# Installing #

- Clone this project to your local drive
- Navigate to the project folder
- run 'bundle install' to install all gems
- Create the necessary tables by running migrations with 'rake db:migrate'
- Seed the database by running 'rake db:seed'
- run 'ruby ./bin/run.rb'

# Navigation #

- Welcome page
- Main Option page where you can navigate to:
  - Get a recommendation
  - View past recommendations
  - View past reviews
  - Logout & Start Over
  - Exit
- From Get a Recommendation, you can choose:
  -Book
  -Movie
  -Quote
- From each type of recommendation, you can:
  - Delete the recommendation
  - Choose to write a review, which you can then delete if you choose.

# Built With #

"activerecord", "~> 5.2"
"sinatra-activerecord"
"sqlite3"

"tty-prompt" - for a beautiful CLI interface
"colorize" - enables text coloring
"rumoji" - for easy encoding/decoding of emoji and text 

