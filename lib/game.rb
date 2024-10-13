require_relative "display"
require_relative "player"

class Game # rubocop:disable Style/Documentation
  include Display
  def initialize
    @player1 = Player.new("X")
    @player2 = Player.new("O")

    @board = Array.new(3) { Array.new(3) }

    Display.intro
    game_loop
  end

  def game_loop
    winner = false
    current_player = "X"
    until winner
      # swap players each turn
      current_player == "X" ? current_player = "O" : current_player = "X" # rubocop:disable Style/ConditionalAssignment

      Display.display_board(@board)
      placement = nil
      until valid_placement?(placement)
        Display.choose_placement(current_player)
        placement = gets.chomp
      end
    end
  end

  def valid_placement?(placement)
  end

  def place_on_board(placement)
  end
end
