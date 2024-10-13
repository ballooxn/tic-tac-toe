module Display # rubocop:disable Style/Documentation
  def self.intro
    "Welcome to Tic-Tac-Toe!"
    "Current score: To-do"
  end

  def self.display_board(board)
    board.each do |row|
      p row
    end
  end

  def self.choose_placement(player)
end
