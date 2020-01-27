
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
ply_win = 0
cmp_win = 0

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You are 'X'. The computer is 'O'."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+----- "
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+----- "
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each do |num|
    new_board[num] = INITIAL_MARKER
  end
  new_board
end

def joinor(arr, delimiter=', ', word='or')
  if arr.empty?
    ''
  elsif arr.size == 1
    arr.first
  elsif arr.size == 2
    arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece(brd)
  square = " "
  loop do
    prompt "Choose a spot on the board: (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, invalid input."
  end
  brd[square] = PLAYER_MARKER
end

def def_minded(line, brd)
  if brd.values_at(*line).count(PLAYER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == ' ' }.keys.first
  else
    nil
  end
end

def aggressive_minded(line, brd)
  if brd.values_at(*line).count(COMPUTER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == ' ' }.keys.first
  else
    nil
  end
end

def computer_places_piece(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = aggressive_minded(line, brd)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = def_minded(line, brd)
      break if square
    end
  end

  if !square
    if brd[5] == INITIAL_MARKER
      square = 5
    end
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner?(brd)
end

def detect_winner?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

loop do
  board = initialize_board

  display_board(board)

  loop do
    player_places_piece(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    prompt "#{detect_winner?(board)} won!"
  else
    prompt "It's a tie!"
  end

  if detect_winner?(board) == "Player"
    ply_win += 1
  elsif detect_winner?(board) == "Computer"
    cmp_win += 1
  end

  break if ply_win == 5 || cmp_win == 5

  puts "The score is Player #{ply_win}, and Computer #{cmp_win}. Do you want to play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
