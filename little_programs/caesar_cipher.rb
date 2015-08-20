def caesar_cipher(string, num)
	new_string = ""
	string.each_char do |chr|

		num.times do

			if chr == "z"
				chr = "a"
				next
			elsif chr == "Z"
				chr = "A"
				next
			end

		    chr.next! if chr =~ /[a-z,A-Z]/
		end

		new_string << chr

	end
	return new_string
end

puts caesar_cipher("What a string!", 5)