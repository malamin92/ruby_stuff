#a tic tac toe game
class TicTacToe
	attr_accessor :player1, :player2
	#crates playes and a game board to play tic tac toe
	def initialize()
		@player1 = Player.new("One", "x")
		@player2 = Player.new("Two", "o")
		@game_board = Board.new
	end

	#prints the board
	def print_board
		@game_board.board.each_with_index do |row, index| 
			puts "#{row.join(" | ")}"
			puts "---------" unless index == 2
		end
	end

	#takes a row and column and assigns a shape to that spot depending on whose turn it is
	def move
		if turn == :playerone
			player_one_turn
		else
			player_two_turn
		end
		@turn += 1
	end

	#determines whose turn it is
	def turn
		@turn = 1
		if @turn % 2 == 1
			return :playerone
		else
			return :playertwo
		end	
	end

	#player ones turn
	def player_one_turn
		puts "#{@player1.name} it's your turn"
		puts "Enter a row (0-2)"
		row = gets.chomp.to_i
		puts "Enter a column (0-2)"
		col = gets.chomp.to_i
		@game_board.board[row][col] = @player1.shape
		print_board
		winner if win?(@player1.shape)

	end

	#player two's turn
	def player_two_turn
		puts "#{@player2.name} it's your turn"
		puts "Enter a row (0-2)"
		row = gets.chomp.to_i
		puts "Enter a column (0-2)"
		col = gets.chomp.to_i
		@game_board.board[row][col] = @player2.shape
		print_board
		winner(@player2.name) if win?(@player2.shape)
	end

	def win?(shape)
		if (@game_board.board[0][0] == shape) && (@game_board.board[0][1] == shape) && (@game_board.board[0][2] == shape)
			return true
		elsif (@game_board.board[1][0] == shape) && (@game_board.board[1][1] == shape) && (@game_board.board[1][2] == shape)
			return true
		elsif (@game_board.board[2][0] == shape) && (@game_board.board[2][1] == shape) && (@game_board.board[2][2] == shape)
			return true
		elsif (@game_board.board[0][0] == shape) && (@game_board.board[1][0] == shape) && (@game_board.board[2][0] == shape)
			return true
		elsif (@game_board.board[0][1] == shape) && (@game_board.board[1][1] == shape) && (@game_board.board[2][1] == shape)
			return true
		elsif (@game_board.board[0][2] == shape) && (@game_board.board[1][2] == shape) && (@game_board.board[2][2] == shape)
			return true
		elsif (@game_board.board[0][0] == shape) && (@game_board.board[1][1] == shape) && (@game_board.board[2][2] == shape)
			return true
		elsif (@game_board.board[0][2] == shape) && (@game_board.board[1][1] == shape) && (@game_board.board[2][0] == shape)
			return true
		else
			return false
		end
	end

	def winner(winner_name)
		puts "You win!"
	end


	#a class that generates an empty board
	class Board
	attr_accessor :board
		def initialize
			@board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
		end
	end

	#a class that assigns creates plaers and assigns them a shape "x" or "o"
	class Player
		attr_accessor :name, :shape
		def initialize(name, shape)
			@name = name
			@shape = shape
		end
	end
end

game = TicTacToe.new
game.player_one_turn
game.player_one_turn
game.player_one_turn

