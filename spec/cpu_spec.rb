require 'cpu'
require 'board'

describe Cpu do
  before(:each) do
    @cpu = Cpu.new
  end

  describe "#initialize" do
    it "gets initialized with the name 'CPU'" do
      expect(@cpu.name).to eq('CPU')
    end
  end

  describe "#piece" do
    it "takes in a piece and outputs it" do
      @cpu.piece = 'X'
      expect(@cpu.piece).to eq('X')
    end
  end

  describe "#turn" do
    it "creates a new minimax object" do
      board = Board.new
      @cpu.turn(board)
      expect(@cpu.minimaxer).to_not eq(nil)
    end

    it "should return a completed board if given ['X','X','O','O','O','X','X','O',' ']" do
      board = Board.new(['X','X','O','O','O','X','X','O',' '])
      @cpu.piece = 'X'
      board = @cpu.turn(board)
      expect(board.data).to eq(['X','X','O','O','O','X','X','O','X'])
    end

    it "resolves in a cats game when played against itself" do
      @cpu.piece = 'X'
      cpu2 = Cpu.new
      cpu2.piece = 'O'
      board = Board.new
      turn = 1

      until board.game_over?
        if turn == 1
          board = @cpu.turn(board)
          turn = 2
        else
          board = cpu2.turn(board)
          turn = 1
        end
      end

      expect(board.status).to eq('tie')
    end
  end
end
