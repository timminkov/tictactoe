require 'player_input'

describe PlayerInput do
  it "is initialized with an IO object" do
    io = Kernel
    input = PlayerInput.new(io)
    input.io.should == io
  end

  describe "#get_players" do
    it "asks the user for the number of players" do
      io = double("kern")
      io.should_receive(:puts) {"Welcome to Tic Tac Toe! Please enter the number of players (1-2)."}
      io.stub(:gets) {"1\n"}

      chooser = PlayerInput.new(io)
      chooser.get_players
    end

    it "returns 1 when the player enters 1" do
      io = double("kern")
      io.stub(:puts)
      io.stub(:gets) {"1\n"}

      chooser = PlayerInput.new(io)
      chooser.get_players.should == 1
    end

    it "returns 2 whent the player enters 2" do
      io = double("kern")
      io.stub(:puts)
      io.stub(:gets) {"2\n"}

      chooser = PlayerInput.new(io)
      chooser.get_players.should == 2
    end

    it "throws an error when the player enters 'a'" do
      io = double("kern")
      io.should_receive(:puts).with("Welcome to Tic Tac Toe! Please enter the number of players (1-2).")
      io.stub(:gets).and_return("a\n", "1\n")

      io.should_receive(:puts).with("Invalid entry. Please choose between 1-2 players.")
      chooser = PlayerInput.new(io)
      chooser.get_players.should == 1
    end

  end

  describe "#get_name" do
    it "asks the player for their name" do
      io = double("kern")
      io.should_receive(:puts).with("Hello Player 1! Please enter your name")
      io.stub(:gets) {'chomp needs a string here'}

      current_player = :player1
      input = PlayerInput.new(io)

      input.get_name(current_player)
    end

    it "returns Tim when the player types Tim" do
      io = double("kern")
      io.stub(:gets) {"Tim\n"}
      io.stub(:puts)

      current_player = :player1
      input = PlayerInput.new(io)

      input.get_name(current_player).should == 'Tim'
    end

    it "returns Eric when the player types Eric" do
      io = double("kern")
      io.stub(:gets) {"Eric\n"}
      io.stub(:puts)

      current_player = :player1
      input = PlayerInput.new(io)

      input.get_name(current_player).should == 'Eric'
    end

    it "throws an error message if the user enters a blank name" do
      io = double("kern")
      io.stub(:gets).and_return("\n","Tim\n")
      io.should_receive(:puts)
      io.should_receive(:puts).with("Sorry! You must enter a name. Please try again.")

      current_player = :player1
      input = PlayerInput.new(io)

      input.get_name(current_player)

    end

    it "asks the player for their name depending on what is passed in" do
      io = double("kern")
      io.should_receive(:puts).with("Hello Player 2! Please enter your name")
      io.stub(:gets) {"Eric\n"}

      current_player = :player2
      input = PlayerInput.new(io)
      input.get_name(current_player)
    end

  end

  describe "#get_move" do
    it "asks the player for their piece" do
      io = double("kern")
      io.stub(:gets).and_return("need another string here for chomp", "5")
      
      name = 'Tim'
      io.should_receive(:puts).with(name + ", please make your move.")
      io.should_receive(:puts).with("Sorry, that is not a valid move. Please enter a valid move.")
            
      input = PlayerInput.new(io)
      input.get_move(name)
    end

    it "returns 0 when the player enters 1" do
      io = double("kern")
      io.stub(:puts)
      io.stub(:gets) {"1\n"}

      name = 'Tim'
      input = PlayerInput.new(io)
      input.get_move(name).should == 0
    end

    it "returns 5 when the player enters 6" do
      io = double("kern")
      io.stub(:puts)
      io.stub(:gets) {"6\n"}

      name = 'Tim'
      input = PlayerInput.new(io)
      input.get_move(name).should == 5
    end

    it "refers to the current player based on their name" do
      io = double("kern")
      io.stub(:gets).and_return("string for chomp\n", "5")

      name = 'Eric'
      io.should_receive(:puts).with(name + ", please make your move.")
      io.should_receive(:puts).with("Sorry, that is not a valid move. Please enter a valid move.")

            
      input = PlayerInput.new(io)
      input.get_move(name)
    end

    it "throws an error when the player makes an invalid move" do
      io = double("kern")
      io.stub(:gets).and_return("10\n", "5")

      name = 'Tim'
      io.should_receive(:puts).with(name + ", please make your move.")
      io.should_receive(:puts).with("Sorry, that is not a valid move. Please enter a valid move.")

      input = PlayerInput.new(io)
      input.get_move(name).should == 4
    end
  end

  describe "#get_piece" do
    it "asks for the current player's piece" do
      io = double("kern")

      name = 'Tim'
      io.stub(:gets) {'X'}
      io.should_receive(:puts).with(name + ", please choose either x or o.")

      input = PlayerInput.new(io)
      input.get_piece(name)
    end

    it "refers to eric by his name" do
      io = double("kern")

      name = 'Eric'
      io.stub(:gets) {'X'}
      io.should_receive(:puts).with(name + ", please choose either x or o.")

      input = PlayerInput.new(io)
      input.get_piece(name)
    end

    it "returns 'X' when the player enters x" do
      io = double("kern")

      name = 'Tim'
      io.stub(:puts)
      io.stub(:gets) {"x\n"}

      input = PlayerInput.new(io)
      input.get_piece(name).should == 'X'
    end

    it "returns 'O' when the player enters o" do
      io = double("kern")

      name = 'Tim'
      io.stub(:puts)
      io.stub(:gets) {"o\n"}

      input = PlayerInput.new(io)
      input.get_piece(name).should == 'O'
    end

    it "returns an error when the player enters i" do
      io = double("kern")

      name = 'Tim'
      io.stub(:gets).and_return("i", "o")
      io.should_receive(:puts).with("You have entered an invalid piece. Please enter either x or o.")
      io.should_receive(:puts).with(name + ", please choose either x or o.")


      input = PlayerInput.new(io)
      input.get_piece(name).should == 'O'
    end
  end
end