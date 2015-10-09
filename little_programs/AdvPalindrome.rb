def adv_palindrome?(str)
	if 
		str.gsub(/[\s+\W]/, "").downcase.reverse ==  str.gsub(/[\s+,\W]/, "").downcase
		return true
	else
		return false
	end
end

puts true if adv_palindrome?("Anne, I vote more cars race Rome-to-Vienna")

def adv_palindrome_simple?(str)
	return true if str.gsub(/[\s+\W]/, "").downcase.reverse ==  str.gsub(/[\s+,\W]/, "").downcase
	return false
end

puts adv_palindrome_simple?("Anne, I vote more cars race Rome-to-Vienna")