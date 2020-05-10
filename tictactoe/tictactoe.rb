require_relative "board"

puts "Board size"
size = gets
board = Board.new(size.to_i)
board.render

while true do
  puts "give field:"
  field = gets
  board.set_move("O", field.to_i)
  board.render
end

