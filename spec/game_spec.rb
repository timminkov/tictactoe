# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'game'

describe Game do
  describe "#create_players" do
    before(:each) do
      io = double("io")
      io.stub(:puts)
      io.stub(:gets).and_return("Tim")
      @io = PlayerInput.new(io)
    end
    it "should take in the number of players" do
      players = 1
      
      game = Game.new(@io)
      game.create_players(players)
    end

    it "creates a player and an ai if 1 is entered" do
      game = Game.new(@io)
      game.create_players(1)

      game.player1.should_not be_nil
      game.player2.should_not be_nil

      game.player1.class.name.should == 'Player'
      game.player2.class.name.should == 'Cpu'
    end

    it "creates 2 players if 2 is entered" do
      game = Game.new(@io)
      game.create_players(2)

      game.player1.should_not be_nil
      game.player2.should_not be_nil

      game.player1.class.name.should == 'Player'
      game.player2.class.name.should == 'Player'
    end

    it "gets player 1's name" do
      game = Game.new(@io)
      game.create_players(1)

      game.player1.name.should == 'Tim'
    end

    it "gets player 2's name" do
      game = Game.new(@io)
      game.create_players(2)

      game.player2.name.should == 'Tim'
    end
  end
end

