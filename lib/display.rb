module Display # rubocop:disable Style/Documentation
  def self.intro
    puts "Welcome to Tic-Tac-Toe!"
    puts " "
  end

  def self.display_board(board)
    puts " "
    board.each do |row|
      p row
    end
    puts " "
  end

  def self.choose_placement(player)
    puts "Choose your placement, Player #{player}!"
    puts "Input two numbers between 0 and 2 seperated by a space."
  end

  def self.end_game(winner)
    puts "Congratulations, Player #{winner}! You have won the game!"
  end

  def self.tie
    puts "The game has ended in a tie!"
  end
end
