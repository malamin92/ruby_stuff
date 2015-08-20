def echo(string)
	return string
end

def shout(string)
	return string.upcase
end

def repeat(string, number = 2)
	string = (string+ " ")*number
	return string.strip
end

def start_of_word(string, number = 1)
	new_string = ""
	i = 0
	while i < number
		new_string = new_string + string[i]
		i += 1
	end
	return	new_string
end

def first_word(string)
	string_array = string.split
	return string_array[0]
end

def titleize(string)
	string_array = string.split
	string_array.each do |word|
		word.capitalize! unless word == "and" || word == "over" || word == "the" 
	end
	string_array[0].capitalize!
	string_array.join(" ")

end
