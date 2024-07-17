# Best tic tac toe ever

class TicTacToe
  def initialize
    @game_board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    @winner = "Noone"
    @player = "o"
    @x_placed = 0
    @o_placed = 0
    play_game
  end

  # Main method.
  def play_game
    while @winner == "Noone"
      @player = "x" if @player == "o" # Make it the new players turn
      puts "Coordinate to put your piece. ex: 0,2"
      coordinate = gets.chomp
      coordinate = coordinate.split(",") # Example: [0,2]
      place_on_board(coordinate[0], coordinate[1])
      @player == "x" ? @x_placed += 1 : @o_placed += 1
    end
    end_game
  end

  # Method for placing a piece on the board
  def place_on_board(x, y)
  end

  # Display the board in the terminal like an actual 3x3 board.
  def display_board; end

  # Method for determining if the player has won

  def winner?(player)
    # Check diagonally, vertically, and side to side.
  end

  def end_game
    puts "#{@winner} is the winner! Congratulations!"
    puts "Do you want to play again?  y/n"
    answer = gets.chomp
    TicTacToe.new if answer == "y"
  end
end

TicTacToe.new
