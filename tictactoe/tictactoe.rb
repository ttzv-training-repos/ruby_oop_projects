require_relative "board"
require_relative "player"

player1 = Player.new("Player 1", "O")
player2 = Player.new("Player 2", "X")
@board = Board.new(player1, player2)
@current_player = player1

@board.show

def game_over?
  @board.show
  case @board.game_state
  when :draw
    puts "Draw"
    return true
  when :winner
    puts "#{@current_player.name} wins!"
    return true
  end
  return false
end


round = 0
while true do
  puts "#{@current_player.name} move:"
  field = gets
  if @board.set_move(@current_player.symbol, field.to_i)
    round += 1
    break if game_over?
    round.even? ? @current_player = player1 : @current_player = player2
  else
    puts "Invalid move, try again"
    @board.show
  end
  
end



