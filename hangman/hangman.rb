class HangMan
	def initialize
	end

	def word_picker
		words = File.readlines("5desk.txt")
		@right_size_words = words.select{|word| (word.strip.length >= 5) && (word.length <= 12) }
		@right_size_words
	end

	def random_word
end

game = HangMan.new
game.word_picker