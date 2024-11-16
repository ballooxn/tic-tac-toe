require_relative "../lib/game"

describe Game do
  describe "place_on_board" do
  end

  describe "valid_placement" do
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
