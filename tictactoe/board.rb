class Board
  
  def initialize()
    @size = 3
    @fields = @size * @size
    @board = []
    @board[0] = '0'
  end
  
  private
  
  def draw?
  @board.filter {|i| i.nil?}.length > 0 ? true : false
  end
  
  def winner?
    
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

