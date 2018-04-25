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

def move(index, value = "X")
  @board[index] = value
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

def turn(index)
  puts "Please enter 1-9:"
  input = gets.strip
  
end


end