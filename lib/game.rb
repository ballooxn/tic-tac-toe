require_relative "display"

class Game # rubocop:disable Style/Documentation
  include Display
  def initialize(board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]], turns = 0)
    @player1 = "X"
    @player2 = "O"
    @winner = false

    @board = board
    @turns = turns
  end

  def start_game
    Display.intro
    game_loop
  end

  def game_loop
    current_player = "O"
    until @winner
      # swap players each turn
      current_player = current_player == "X" ? "O" : "X"

      place_on_board(current_player)
      @turns += 1
      Display.display_board(@board)
      @winner = game_over?(current_player)
    end
    @winner == "Tie" ? Display.tie : Display.end_game(@winner)
  end

  def place_on_board(player, x = -1, y = -1)
    until valid_placement?(x, y)
      Display.choose_placement(player)
      placement = gets.chomp.split
      x = placement[0].to_i
      y = placement[1].to_i
    end
    @board[x][y] = player
  end

  def valid_placement?(x, y)
    return false unless (x >= 0 && x <= 2) && (y >= 0 && y <= 2)

    return false unless @board[x][y] == "_"

    true
  end

  def game_over?(player)
    # check horizontally + vertically
    @board.each_with_index do |row, i|
      return player if row[0] == player && row[1] == player && row[2] == player
      return player if @board[0][i] == player && @board[1][i] == player && @board[2][i] == player
    end
    # check diagonally
    return player if @board[0][0] == player && @board[1][1] == player && @board[2][2] == player
    return player if @board[0][2] == player && @board[1][1] == player && @board[2][0] == player

    return "Tie" if @turns >= 8

    false
  end
end
