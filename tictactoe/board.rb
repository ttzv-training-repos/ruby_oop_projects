class Board
  
  def initialize(player1, player2)
    @size = 3
    @fields = @size * @size 
    @board = Array.new(@fields + 1) # +1 because we start Board array at index 1 for convenience
    @board[0] = '0'
    @win_condition = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @player1_symb = player1.symbol
    @player2_symb = player2.symbol
  end
  
  private
  
  def draw?
    @board.all?
  end
  
  def winner?
    win = false
    @win_condition.each do |combination|
      win = same_vals?(combination)
      break if win
    end
    win
  end

  def same_vals?(arr)
    arr.all? do |element|
      if(@board[arr[0]].nil?)
        false
      else
        @board[element] == @board[arr[0]]
      end
    end
  end
  
  public

  def set_move(symbol, field)
    if field.between?(1, @fields) && @board[field].nil?
      @board[field] = symbol
      return true
    else
      return false
    end
  end

  def show
    1.upto(@fields) do |i|
      print @board[i].nil? ? i : @board[i]
      print i % @size == 0 ?  "\n" : ""
    end
  end

  def game_state
    return :winner if winner?
    return :draw if draw?
    false
  end

end

