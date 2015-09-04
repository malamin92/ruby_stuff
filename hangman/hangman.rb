class HangMan
	require "yaml"

	attr_accessor :word, :bracket, :chances_left

	def initialize
		@bracket = ""
		@word = ""
		@chances_left = 7
	end

	def word_picker
		words = File.readlines("5desk.txt")
		@right_size_words = words.select{|word| (word.strip.length >= 5) && (word.strip.length <= 12) }	
		@right_size_words.sample.gsub(/[\r\n]/, "").downcase
	end

	def set_word
		@word = word_picker
	end

	def set_bracket
		i = 0
		while i < @word.length
			@bracket[i] = "_" 
			i += 1
		end
	end

	def print_bracket
		puts @bracket
		puts "#{@word.length} letters."
	end

	def guess_letter
		puts "Please enter a letter you'd like to guess, or enter 'save' to save your game ad go to menu:"
		guess_input = gets.chomp.downcase

		if guess_input.length == 1
			check_guess(guess_input)
		elsif guess_input == "save"
			save
			puts "Game was saved."
			game_menu
		else
			puts "Your input is invalid, try again!"
			guess_letter
		end
			
	end

	def check_guess(letter)
		if @word.include?(letter)
			i = 0
			while i < @word.length
				if @word[i] == letter
					@bracket[i] = letter
				end
				i += 1
			end
			puts
			puts "You guessed a correct letter. :)"
			puts "YOU GUESSED ALL THE LETTERS! YOU WIN! :D" if win?
		else
			puts
			puts "You guessed an incorrect letter. :("
			@chances_left -= 1
		end
	end

	def win?
		if @word == @bracket
			true
		else
			false
		end
	end

	def game_setup
		set_word
		set_bracket
	end

	def play
		while @chances_left > 0 && !win?
			puts
			puts "You have #{@chances_left} guesses left." unless win?
			puts
			print_bracket
			puts
			guess_letter
			puts "Sorry, you couldn't guess the word, you lose. :'( \nThe word was '#{@word}'." if @chances_left == 0
		end

		game_menu
	end

	def load_game
		load
		@word = @yaml.word
		@bracket = @yaml.bracket
		@chances_left = @yaml.chances_left
		play
	end

	def save
		file = File.new("save.txt", "w")
		file.write(YAML::dump(self))
	end

	def load
		file = File.read("save.txt")
		@yaml = YAML::load(file)
	end

	def game_menu
		puts "Enter an option:\n1. New Game \n2. Load Previous Game\n3. Quit"
		option = gets.chomp.to_i
		case option
		when 1
			game_setup
			play
		when 2
			load_game
		when 3
			return 0
		else
			puts "Please enter option '1', '2' or '3'."
			game_menu
		end
	end
end

game = HangMan.new
game.game_menu


