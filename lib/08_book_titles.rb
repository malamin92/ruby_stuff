class Book
  # TODO: your code goes here!
  attr_accessor :title

	def	title=(book_title)
		book_string_array = book_title.split
		word_count = book_string_array.length
		i = 0
		while i < word_count
			word = book_string_array[i]
			book_string_array[i] = word.capitalize unless (word == "and" || word == "in" || word == "the" || word == "of" || word == "a" || word == "an")
			i+=1
		end	
		book_string_array[0] = book_string_array[0].capitalize
		@title = book_string_array.join(" ")
	end
end
