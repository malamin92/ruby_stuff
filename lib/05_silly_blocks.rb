def reverser
	words = yield.split(" ").collect{|words| words.reverse}
	return words.join(" ")
end

def adder(num=1)
	return yield + num
end

def repeater(num = 1)
	num.times do
		yield
	end
end