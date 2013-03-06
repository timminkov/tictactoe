# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'game_starter'

describe GameStarter do
  describe "#create_players" do
    it "should take in the number of players" do
      players = 1
      
      chooser = GameStarter.new(Kernel)
      chooser.create_players(players)
    end

    it "creates a player and an ai if 1 player is entered" do
      players = 1

      chooser = GameStarter.new(Kernel)
      chooser.create_players(players)


    end
  end
end

