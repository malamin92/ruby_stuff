def substrings(word, substr)

	ans_hash = {}

	substr.each do |dic_word|
		word_count = word.scan(dic_word).length
		ans_hash[dic_word] = word_count if word_count > 0
	end
	return ans_hash


end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)