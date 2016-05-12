WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Top row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left-right X
  [6,4,2]  # Right-left X
]

def play(board)
  while !over?(board)
    turn(board)
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Its a tie! Run the program again for another shot"
    end
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  until valid_move?(board, input)
 puts "Please enter 1-9:"
  input = gets.chomp
end
    move(board, input, current_player(board))
    display_board(board)
end

def display_board(board)
  puts" #{board[0]} | #{board[1]} | #{board[2]}  "
  puts"-----------"
  puts" #{board[3]} | #{board[4]} | #{board[5]} "
  puts"-----------"
  puts" #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, position)
  num = position.to_i
  if num.between?(1,9) && (position_taken?(board, num - 1) == false)
    return true
  else
    false
  end
end

def position_taken?(board, position)
  if board[position.to_i] == " " || board[position.to_i] == "" || board[position.to_i] == nil
    false
  else
    true
  end
end

def move(board, position, token)
  board[position.to_i - 1] = token
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O" || position == "x" || position == "o"
      counter += 1
    else
    end
  end
    counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end




def won?(board)
  WIN_COMBINATIONS.detect do |winner|
    board[winner[0]] == board[winner[1]] &&
    board[winner[1]] == board[winner[2]] &&
    position_taken?(board, winner[0])
  end
end

def full?(board)
  return board.all? { |position| position == "X" || position == "O"}
end

def draw?(board)
  if won?(board) || !full?(board)
    false
  else
    true
  end
end

def over?(board)
  if won?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  result = won?(board)
  if !result
    return nil
  elsif board[result[0]] == "X"
    return "X"
  else
    return "O"
  end
end
