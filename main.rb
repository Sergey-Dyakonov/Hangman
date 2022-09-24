require "open-uri"
require "./round"
require "./hangman"

puts "Welcome to Hangman! Try to guess the word!"
input = ""
while input != "y"
  round = Round.new
  until round.is_finished
    round.play
  end
  print "Exit? (y|n):"
  input = gets.chomp
end

puts "GL HV!"
