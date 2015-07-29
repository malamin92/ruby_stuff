class Book
	attr_accessor :title

	def title=(new_title)
		temp_title = new_title.split
		title_length = temp_title.length
		i=0
		while i < title_length
			word = temp_title[i]
			temp_title[i] = word.capitalize unless (word == "and" || word == "in" || word.include?("the") || word.include?("of") || word == "a" || word == "an")
			i+=1
		end 
		temp_title[0].capitalize!
		@title = temp_title.join(" ")
	end
end
