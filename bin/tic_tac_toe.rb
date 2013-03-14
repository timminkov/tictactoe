require 'game'

kern = Kernel
io = PlayerInput.new(kern)
game = Game.new(io)
game.run