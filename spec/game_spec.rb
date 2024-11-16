require_relative "../lib/game"

describe Game do # rubocop:disable Metrics/BlockLength
  describe "game_loop" do
    subject(:fake_game) { described_class.new }

    context "when 3 falses then true" do
      before do
        allow(fake_game).to receive(:game_over?).and_return(false, false, false, "X")
        allow(fake_game).to receive(:place_on_board)
        allow(fake_game).to receive(:display_board)
      end

      it "loops three times" do
        expect(fake_game).to receive(:place_on_board).exactly(4).times
        fake_game.game_loop
      end
    end
  end

  describe "place_on_board" do
    context "given placement" do
      subject(:board_placement) { described_class.new }
      before do
        allow(board_placement).to receive(:valid_placement).and_return(true)
      end

      it "changes the board" do
        changed_board = [%w[X _ _], %w[_ _ _], %w[_ _ _]]
        expect { board_placement.place_on_board("X", 0, 0) }.to change {
                                                                  board_placement.instance_variable_get(:@board)
                                                                }.to(changed_board)
      end
    end
  end

  describe "valid_placement" do
    context "when given valid placement" do
      subject(:check_placement) { described_class.new }
      it "returns true" do
        expect(check_placement.valid_placement?(0, 0)).to be_truthy
      end
    end

    context "when given invalid placement" do
      subject(:check_placement) { described_class.new }
      it "returns false" do
        expect(check_placement.valid_placement?(8, 3)).to be_falsey
      end
    end

    context "when placement taken" do
      board = [%w[O _ _], %w[_ _ _], %w[_ _ _]]
      subject(:check_placement) { described_class.new(board) }
      it "returns false" do
        expect(check_placement.valid_placement?(0, 0)).to be_falsey
      end
    end
  end

  describe "game_over" do
    context "when horizontal X win" do
      board = [%w[X X X], %w[_ O _], %w[O _ _]]
      subject(:horizontal_win) { described_class.new(board) }

      it "returns x" do
        expect(horizontal_win.game_over?("X")).to eql("X")
      end
    end

    context "when vertical X win" do
      board = [%w[X _ _], %w[X O _], %w[X O _]]
      subject(:vertical_win) { described_class.new(board) }

      it "returns x" do
        expect(vertical_win.game_over?("X")).to eql("X")
      end
    end

    context "when diagonal X win" do
      board = [%w[X O _], %w[_ X _], %w[O _ X]]
      subject(:diagonal_win) { described_class.new(board) }

      it "returns x" do
        expect(diagonal_win.game_over?("X")).to eql("X")
      end
    end

    context "when tie" do
      board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
      subject(:tie) { described_class.new(board, 9) }

      it "returns x" do
        expect(tie.game_over?("X")).to eql("Tie")
      end
    end

    context "when no winner" do
      board = [%w[X O _], %w[_ O _], %w[O _ X]]
      subject(:no_winner) { described_class.new(board) }

      it "returns false" do
        expect(no_winner.game_over?("X")).to be_falsey
      end
    end
  end
end
