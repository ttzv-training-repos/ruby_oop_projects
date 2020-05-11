require_relative "board"
require_relative "player"

board = Board.new()
player1 = Player.new("Player 1", "O")
player2 = Player.new("Player 2", "X")
board.show

current_player = player1
iter = 0
while true do
  puts "#{current_player.name} move:"
  field = gets
  if board.set_move(current_player.symbol, field.to_i)
    iter += 1
    iter % 2 == 0 ? current_player = player1 : current_player = player2
  else
    puts "Invalid move, try again"
  end
  puts board.game_state
  board.show
end

