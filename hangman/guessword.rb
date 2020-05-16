class GuessWord
  attr_reader :guessword, :tries

  def initialize(words, tries)
    word_list = filter_by_criterium(5, 12, words)
    @guessword = word_list[rand(word_list.length-1)].strip
    @game_array = Array.new(@guessword.length-1)
    @blank_char = "_"
    @game_array.map!{|el| el=@blank_char if el.nil?}
    @tries = tries
  end

  private

  def filter_by_criterium(minlength, maxlength, wordlist)
    wordlist.filter! {|w| w.strip.length.between?(minlength, maxlength)}
  end

  def find_indices(array, val)
    array.map.with_index{|k, i| i if k == val}.compact
  end

  def game_state
    if @game_array.include?(@blank_char) && @tries > 0
      return :nextguess 
    elsif @tries == 0 
      return :gameover 
    else
      return :win
    end
  end

  public

  def guess(letter)
    if @game_array.include?(letter) 
      puts "You already chose this letter"
    end
    guess = find_indices(@guessword.split(''), letter)
    if guess.length > 0 
      guess.each{|g| @game_array[g] = letter}
    else
      @tries -= 1
    end
  end

  def next_guess?
    if game_state == :nextguess 
      true 
    else
      false
    end
  end

  def win?
    true if game_state == :win
  end

  def print_word
    puts @game_array.join
  end

  def tries_left
    puts "Tries left: #{@tries}"
  end
  
end