#a tic tac toe game
class TicTacToe
	attr_accessor :player1, :player2
	#crates playes and a game board to play tic tac toe
	def initialize()
		@player1 = Player.new("Player One", "x")
		@player2 = Player.new("Player Two", "o")
		@game_board = Board.new
	end

	#prints the board
	def print_board
		@game_board.board.each_with_index do |row, index| 
			puts "#{row.join(" | ")}"
			puts "---------" unless index == 2
		end
		puts
		puts
	end

	#determines whose move it is
	def move
		if @turn % 2 == 1
			player_one_turn
		else
			player_two_turn
		end
		@turn += 1
	end

	def valid_move?(row, col)
		if @game_board.board[row][col] == " "
			return true
		else
			return false
		end
	end

	#player ones turn
	def player_one_turn
		print_board
		puts "#{@player1.name} it's your turn:"
		puts "Enter a row (0-2)"
		row = gets.chomp.to_i
		puts "Enter a column (0-2)"
		col = gets.chomp.to_i
		if valid_move?(row, col)
			@game_board.board[row][col] = @player1.shape
		else
			puts "There's already a shape at that position."
			player_one_turn
		end

		if win?(@player1.shape)
			winner(@player1.name)
			@winner = true
		end
	end

	#player two's turn
	def player_two_turn
		print_board
		puts "#{@player2.name} it's your turn:"
		puts "Enter a row (0-2)"
		row = gets.chomp.to_i
		puts "Enter a column (0-2)"
		col = gets.chomp.to_i
		if valid_move?(row, col)
			@game_board.board[row][col] = @player2.shape
		else
			puts "There's already a shape at that position."
			player_two_turn
		end

		if win?(@player2.shape)
			winner(@player2.name)
			@winner = true
		end
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

	def draw?
		if @turn > 9
			print_board
			puts "The game ended in a draw. :)"
			@winner = true
			return true
		end
		false
	end

	def winner(winner_name)
		puts "#{winner_name}, YOU WIN!!!"
	end

	def play
		@turn = 1
		@winner = false

		until @winner
			move unless draw?
		end
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
game.play
