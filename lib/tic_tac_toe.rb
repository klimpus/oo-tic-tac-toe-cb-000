class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], #top_row_win
  [0,4,8], #left_diagonal_win
  [0,3,6], #left_column_win
  [1,4,7], #middle_column_win
  [2,5,8], #right_column_win
  [2,4,6], #right_diagonal_win
  [3,4,5], #middle_row_win
  [6,7,8] #bottom_row_win
]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, player = "X")
  @board[index] = player
end

def position_taken?(index)
if @board[index] == " " || @board[index] == "" || @board[index] == nil
    return FALSE
  else
    return TRUE 
end
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player = current_player
  if valid_move?(index)
    move(index, player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end

  end
else
  false
end

def full?
  !@board.any? { |x| x == " " }
end

def draw?
  if !won? && full?
    return true
  else
    return false
  end
end

def over?
  if won? || draw? || full?
    return true
  else
    return false
  end
end

def winner
  winning_board = won?
 if winning_board == false
   return nil
 elsif @board[winning_board[0]].include?("X")
   "X"
 else @board[winning_board[0]].include?("O")
   "O"
 end
end

def play
  until over? == true || won? != false
    turn
  end
  if winner == "X"
    puts "Congratulations X!" 
  elsif winner== "O"
    puts "Congratulations O!"
  elsif draw?
    puts "Cat's Game!"
  else
    return nil
  end
end

end