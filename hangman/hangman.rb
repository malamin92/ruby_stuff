class HangMan
	attr_accessor :word, :bracket, :chances_left
	def initialize
		@bracket = ""
		@word = ""
		@chances_left = 7
	end

	def word_picker
		words = File.readlines("5desk.txt")
		@right_size_words = words.select{|word| (word.strip.length >= 5) && (word.length <= 12) }
		@right_size_words.sample
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
		puts "#{@word.length} letters."
	end




end

game = HangMan.new
game.set_word
game.set_bracket
puts game.bracket
