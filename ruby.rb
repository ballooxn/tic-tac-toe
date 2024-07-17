# Best tic tac toe ever

class TicTacToe
  def initialize
    @game_board = [[_, _, _], [_, _, _], [_, _, _]]
    @winner = "Noone"
    @player = "o"
    @total_pieces_placed = 0
    play_game
  end

  # Main method.
  def play_game
    while @winner == "Noone"
      @player = "x" if @player == "o" # Make it the new players turn
      # Get the coordinates to place the player's piece, then place it on the board
      puts "Coordinate to put your piece. ex: 0,2"
      coordinate = gets.chomp
      coordinate = coordinate.split(",") # Example: [0,2]
      place_on_board(coordinate[0], coordinate[1])

      # On the 5th turn, the x player can place their 3rd piece.
      # We're only checking for a winner once 3 or more pieces of the same kind are on the board
      @winner = winner? if @total_pieces_placed >= 5
      unless @winner == "Noone" # if theres a winner, end the game
        end_game
        return
      end
    end
    end_game
  end

  # Method for placing a piece on the board
  def place_on_board(x, y)
    @game_board[x][y] = @player
  end

  # Display the board in the terminal like an actual 3x3 board.
  def display_board
  end

  # Method for determining if the player has won

  def winner?(x, y)
    # Check diagonally, vertically, and side to side.
    return "x"
    "o"
  end

  def end_game
    if @winner == "Noone"
      puts "Tie!"
    else
      puts "#{@winner} is the winner! Congratulations!"
    end
    puts "Do you want to play again?  y/n"
    answer = gets.chomp
    TicTacToe.new if answer == "y"
  end
end

TicTacToe.new
