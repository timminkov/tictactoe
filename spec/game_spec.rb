require 'game'
require 'player_input'
require 'board'

describe Game do
  describe "#create_players" do
    before(:each) do
      @playerinput = double("playerinput")
      @playerinput.stub(:get_name).and_return('Tim')
      @playerinput.stub(:get_piece)
      @game = Game.new(@playerinput)
    end
    
    it "should take in the number of players" do
      @playerinput.should_receive(:get_name).with(1).and_return('Tim')
      @game.create_players(1)
    end

    it "creates a player and an ai if 1 is entered" do
      @game.create_players(1)

      @game.player1.should_not be_nil
      @game.player1.class.name.should == 'Player'

      @game.player2.should_not be_nil
      @game.player2.class.name.should == 'Cpu'
    end

    it "creates 2 players if 2 is entered" do
      @game.create_players(2)

      @game.player1.should_not be_nil
      @game.player1.class.name.should == 'Player'

      @game.player2.should_not be_nil
      @game.player2.class.name.should == 'Player'
    end

    it "gets player 1's name" do
      @game.create_players(1)
      @game.player1.name.should == 'Tim'
    end

    it "gets player 2's name" do
      @game.create_players(2)
      @game.player2.name.should == 'Tim'
    end
  end
end