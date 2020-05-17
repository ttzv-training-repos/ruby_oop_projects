require_relative 'guessword'
require 'yaml'

def savedir_empty?
  Dir.mkdir 'saves' if not Dir.exist? 'saves'
  Dir.entries('saves').length <= 2
end

def save_list
  list = Dir.entries('saves')
  list.filter { |entry| entry != '.' and entry != '..' }
end

def latest_increment
  save_list.map { |entry| entry.split('_')[1].gsub!('.yaml', '').to_i }.max
end

def savename(increment)
  "save_#{increment}.yaml"
end

def save_game
  file_path = 'saves/'
  if savedir_empty?
    file_path += savename 1
  else
    increment = latest_increment + 1
    file_path += savename increment
  end
  File.open(file_path, 'w') { |file| file.puts(YAML.dump(@guessword)) }
  file_path
end

def load_game(save)
  save_path = "saves/#{save}"
  @guessword = YAML.load(File.open(save_path, 'r'))
end

def new_game 
  word_list = File.readlines('5desk.txt')
  @guessword = GuessWord.new(word_list)
end

def load_menu 
  puts 'Which save would you like to load?'
  save_list.each_with_index do |entry, i|
    puts "#{i+1}. #{entry}"
  end 
  puts 'Your choice: '
  input = gets.strip.to_i - 1
  load_game save_list[input]
end

def show_menu
  puts 'Welcome! Would you like to continue your last game?'
  puts '1. Continue'
  puts '2. New game'
  puts '3. Load game'
  puts 'Your Choice: '
  choice = gets.strip
  case choice
  when '1'
    load_game(savename latest_increment)
  when '2'
    new_game
  when '3'
    load_menu
  else
    puts 'No such option, loading last game'
    load_game(savename latest_increment)
  end
end

if savedir_empty?
  new_game
else
  show_menu
end

puts 'You can save ongoing game by typing \'!s\' instead of a letter'
while @guessword.next_guess?
  puts 'Letter:'
  input = gets.strip.upcase
  if input == '!S'
    puts 'game saved at:'
    puts save_game
    next
  end
  @guessword.guess(input)
  @guessword.print_word
  @guessword.tries_left
end

if @guessword.win?
  puts 'You win'
else
  puts 'You lose'
  puts "The word was: #{@guessword.guessword}"
end
