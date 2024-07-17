# Best tic tac toe ever

class TicTacToe
  def initialize
    @game_board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
    @winner = "Noone"
    @player = "x"
    @total_pieces_placed = 0
    play_game
  end

  # Main method.
  def play_game
    while @winner == "Noone"
      puts ""
      puts "Player: #{@player}"
      x = 5
      y = 5
      # Get the coordinates to place the player's piece, then place it on the board
      square_not_taken = false
      until square_not_taken == true

        until x >= 0 && x <= 2
          print "X-Coordinate: "
          x = gets.chomp.to_i
        end
        until y >= 0 && y <= 2
          print "Y-Coordinate: "
          y = gets.chomp.to_i
        end
        square_not_taken = true if @game_board[x][y] == "_"
        next if square_not_taken

        x = 5
        y = 5
        puts "That square is taken, try a different square!"
      end
      place_on_board(x, y)
      display_board

      @total_pieces_placed += 1
      # On the 5th turn, the x player can place their 3rd piece.
      # We're only checking for a winner once 3 or more pieces of the same kind are on the board
      answer = winner?(x, y) if @total_pieces_placed >= 5
      puts answer
      @winner = @player if answer
      unless @winner == "Noone" # if theres a winner, end the game
        end_game
        return
      end
      # Swap players
      @player = if @player == "x"
                  "o"
                else
                  "x"
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
    puts ""
    3.times do |i|
      3.times do |j|
        print @game_board[i][j]
      end
      puts ""
    end
    puts ""
  end

  # Method for determining if the player has won

  def winner?(x, y)
    # Check vertically
    return true if @game_board[x][y - 1] == @player && @game_board[x][y - 2] == @player
    # Check horizontally
    return true if @game_board[x - 1][y] == @player && @game_board[x - 2][y] == @player
    # Check diagonally left
    return true if @game_board[x - 1][y - 1] == @player && @game_board[x - 2][y - 2] == @player

    return true if (x == 2 && y.zero?) && (@game_board[x - 1][y + 1] == @player && @game_board[x - 2][y + 2] == @player)

    return true if (x == 1 && y == 1) && (@game_board[x - 1][y + 1] == @player && @game_board[x + 1][y - 1] == @player)

    # there is no winner

    false
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
