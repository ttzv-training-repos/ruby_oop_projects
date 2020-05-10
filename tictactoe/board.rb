class Board

  def initialize(size=3)
    if size < 3 || !size.is_a?(Integer)
      size = 3
      puts "Incorrect or empty value, creating Board with default size: #{size}"
    end
    @size = size
    @fields = size * size
    @board = []
  end

  public

  def set_move(symbol, field)
    if field.between?(0, @fields-1)
      @board[field] = symbol
    end
  end

  def render()
    1.upto(@fields) do |i|
      print @board[i].nil? ? i : @board[i]
      print i % @size == 0 ?  "\n" : ""
    end
  end

end

