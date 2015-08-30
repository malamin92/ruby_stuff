class TicTacToe

	def initialize()
		@player1 = Player.new("One", "x")
		@player2 = Player.new("Two", "o")
		@game_board = Board.new
	end

	def print_board
		@game_board.board.each_with_index do |row, index| 
			puts "#{row.join(" | ")}"
			puts "---------" unless index == 2
		end
	end

	def move(row, col)
	end

	class Board

		def initialize
			@board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
		end
	end

	class Player
		def initialize(name, shape)
			@name = name
			@shpae = shape
		end
	end
end

game = TicTacToe.new
game.print_board