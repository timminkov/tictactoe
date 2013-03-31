class BasePlayer
	def other_piece
		return 'X' if @piece == 'O'
    	'O' if @piece == 'X'
	end
end
