# WordleGame

WordleGame is a Ruby gem that allows you to play the popular word-guessing game Wordle in your terminal.

## Installation

To install WordleGame, simply add this line to your application's Gemfile:

```ruby
gem 'wordle_game'

And then execute:

bash

$ bundle install

Or install it yourself as:

bash

$ gem install wordle_game
 
# Usage 
 
After installing the gem, you can start playing Wordle by requiring the gem and creating an instance of the WordleGame class.

ruby

require 'wordle_game'

# Create a new game
game = WordleGame.new
puts "Guess the word with #{game.word_length} letters"

loop do
  print "Enter your guess: "
  attempt = gets.chomp
  status = game.submit_attempt(attempt)
  puts status
  break if status.include?("Answer received") || status.include?("Out of attempts")
end

The submit_attempt method takes a string as input and checks it against the hidden word. It will return feedback based on the correctness of the guess.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SebasTheOnlyOne/wordle_game.

## License

The gem is available as open source under the terms of the MIT License.

## Additional Information

For more information, please refer to the official documentation.
