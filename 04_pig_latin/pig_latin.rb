def translate(string)
	string_array = string.split
	string_length = string_array.size
	i=0
	while i < string_length
		word = string_array[i]
		word_length = word.length-1
		if "aeiou".include?(word[0])
			word = word + "ay"
			string_array[i] = word

		elsif word[0..2] == "squ"
			word = word[3..word_length]+"squay"
			string_array[i] = word

		elsif word[0..1] == "qu"
			word = word[2..word_length]+"quay"
			string_array[i] = word

		elsif word[0..2] == "sch"

			word = word[3..word_length]+"schay"
			string_array[i] = word

		elsif (!"aeiou".include?(word[0]) && !"aeiou".include?(word[1]) && !"aeiou".include?(word[2]))
			word = word[word_length]+word[word_length-1]+word[0..word_length-2]+"ay"
			string_array[i] = word

		elsif !"aeiou".include?(word[0]) && !"aeiou".include?(word[1])
			word = word[2..word_length]+word[0]+word[1]+"ay"
			string_array[i] = word

		elsif !"aeiou".include?(word[0])
			word = word[1..word_length]+word[0]+"ay"
			string_array[i] = word

		
		
		#elsif word[0] != ( "a" || "e" || "i" || "o" || "u" ) && word[1] != ( "a" || "e" || "i" || "o" || "u" )
		#	word_length = word.length-1
		#	word = word[2..word_length]+word[0]+word[1]+"ay"
		#	string_array[i] = word

		#elsif word[0] != ( "a" || "e" || "i" || "o" || "u" )
		#	word_length = word.length-1
		#	word = word[1..word_length]+word[0]+"ay"
		#	string_array[i] = word

		end

		i += 1
	end
	return string_array.join(" ")
end