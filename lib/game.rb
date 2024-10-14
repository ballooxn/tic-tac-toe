require_relative "display"
require_relative "player"

class Game # rubocop:disable Style/Documentation
  include Display
  def initialize
    @player1 = "X"
    @player2 = "O"

    @board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
    @num_of_turns = 0

    Display.intro
    game_loop
  end

  protected

  def game_loop
    winner = false
    current_player = "O"
    while winner == false
      # swap players each turn
      current_player == "X" ? current_player = "O" : current_player = "X" # rubocop:disable Style/ConditionalAssignment

      place_on_board(current_player)
      winner = game_over?(current_player)
      @num_of_turns += 1
      Display.display_board(@board)
    end
    if winner == "Tie"
      Display.tie
    else
      Display.end_game(winner)
    end
  end

  def place_on_board(player)
    x, y = 5
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
    # check horizontally
    @board.each do |row|
      return player if row[0] == player && row[1] == player && row[2] == player
    end
    # check vertically
    3.times do |i|
      return player if @board[0][i] == player && @board[1][i] == player && @board[2][i] == player
    end
    # check diagonally
    return player if @board[0][0] == player && @board[1][1] == player && @board[2][2] == player
    return player if @board[0][2] == player && @board[1][1] == player && @board[2][0] == player

    return "Tie" if @num_of_turns == 8

    false
  end
end
