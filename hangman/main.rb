require_relative 'guessword'

word_list = File.readlines("5desk.txt")

guessword = GuessWord.new(word_list, 6)

while guessword.next_guess?
  puts guessword.next_guess?
  puts "Letter:"
  guess_letter = gets.strip
  guessword.guess(guess_letter)
  guessword.print_word
  guessword.tries_left
end

if guessword.win?
  puts "You win"
else
  puts "You lose"
  puts "The word was: #{guessword.guessword}"
end