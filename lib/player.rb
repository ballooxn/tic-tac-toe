class Player # rubocop:disable Style/Documentation
  attr_accessor :score
  attr_reader :letter

  def initialize(letter)
    @letter = letter
  end
end
