puts "Welcome to tic-tac-toe. Are you ready to engage in one of the most classic childhood games?
\n
Prepare to face off in a battle between X's and O's
\n"
puts
puts "Player one. May I have your name?"
$player1 = gets.chomp
puts "And now, player two. What doth thou call yourself?"
$player2 = gets.chomp


board = Array.new(9, " ")

helper_board = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def update_board_x(board, user_selection)
  board[user_selection] = "X"
  return board
end

def update_board_o(board, user_selection)
  board[user_selection] = "O"
  return board
end

def is_valid_selection?(board, num)
    number = num.to_i
  if board[number] == "" || board[number] == " "
    
    return number
  elsif number > 8
    puts "That number is not valid. Pick a number between 0 and 8."
    is_valid_selection?(board, gets.chomp)
      else puts "That space is filled. Pick another space." 
    is_valid_selection?(board, gets.chomp)
  end
end


def game(board, helper_board)
  
i = 0
while i < 4
  
  display_board(board)
  puts
  display_board(helper_board)
  puts "Player 1, pick a number to place your X on that spot."
  user_selection = is_valid_selection?(board, gets.chomp)
  update_board_x(board, user_selection)
  display_board(board)
    puts
  display_board(helper_board)
  winning_combinations(board, "X")
  if winning_combinations(board, "X") == "X" 
    puts is_winner?(winning_combinations(board, "X"))
    break
  end
  puts "Player 2, pick a number to place your O on that spot."
  user_selection = is_valid_selection?(board, gets.chomp)
  update_board_o(board, user_selection)
  display_board(board)
  winning_combinations(board, "O")
  if winning_combinations(board, "O") == "O"
    puts is_winner?(winning_combinations(board, "O"))
    break
  end
  
  i += 1
 
end
if i > 3
  puts "It's a tie!"
end
end

def is_winner?(letter)

if letter == "X"
  puts
  puts "*------------*"
  puts "#{$player1} wins!"
  puts "*------------*"
end
if letter == "O"
  puts
  puts "*------------*"
  puts "#{$player2} wins!"
  puts "*------------*"
end
end

def winning_combinations(board, letter)
  #rows
if (board[0] == letter && board[1] == letter && board[2] == letter)
  return letter
end
if (board[3] == letter && board[4] == letter && board[5] == letter)
  return letter
end
if (board[6] == letter && board[7] == letter && board[8] == letter)
  return letter
end
#columns
if (board[0] == letter && board[3] == letter && board[6] == letter)
  return letter
end
if (board[1] == letter && board[4] == letter && board[7] == letter)
  return letter
end
if (board[2] == letter && board[5] == letter && board[8] == letter)
  return letter
end
#diagonals
if (board[0] == letter && board[4] == letter && board[8] == letter)
  return letter
end
if (board[6] == letter && board[4] == letter && board[2] == letter)
  return letter
end

end

puts "This is your game board 
\n"
print display_board(board)
puts "\n Player one will be X. Player 2 will be O. You will alternate placing an X or an O in one of the 9 boxes on the board. \n 
If 3 boxes in a row are filled with your letter, you win."

game(board, helper_board)