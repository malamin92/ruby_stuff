class MasterMind
	attr_accessor :secret_code, :guess_board

	PEG_COLORS = ["red", "yellow", "blue", "green", "purple", "black"]

	def initialize 
			@secret_code = []
			@guess_board = []
	end

	def random_code
		4.times do 
			@secret_code << PEG_COLORS[random_number]
		end

		puts "A Random Code Has Been Generated."

	end

	def random_number
		number = rand(0..5)
	end

	def guess_colors
		puts "\nGuess colors, type four colors seperated by spaces."
		puts "Chose from: [red] [yellow] [blue] [green] [purple] [black]"
		puts "Type them in the order arranged on the guess board."
		@player_guess = gets.chomp

		split_guesses(@player_guess)
	end

	def split_guesses(string)
		@guess_board = string.downcase.split(" ")
	end

	def valid_guess(arr)
		if arr.size == 4 && arr.each {|color| PEG_COLORS.include?(color)}
			return true
		end
		puts "You did not enter the guesses correctly. \n"
		return false
	end

	def feedback
		i = 0
		feedback = false
		while i < 4
			if @secret_code.include?(@guess_board[i]) && @secret_code[i] == @guess_board[i]
				puts "***Right Place and Color***"
				feedback = true
			elsif @secret_code.include?(@guess_board[i])
				puts "***Right Color***" 
				feedback = true
			end
			i+=1
		end
		puts "You guessed the code, YOU ARE MASTERMIND!" if win?
		puts "--No Correct Guesses--" if !feedback
	end

	def win?
		return true if @guess_board == @secret_code
		return false
	end

	def play
		random_code

		12.times do |turn|
			puts "This is turn:#{turn+1}, time to guess! \n"
			guess_colors
			if valid_guess(@guess_board)
				feedback
			else
				guess_colors
			end
			break if win?
		end
	end

end

game = MasterMind.new
game.play
