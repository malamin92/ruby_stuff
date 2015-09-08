def fibs(num)
	curr = 1
	prev = 0
	i = 0
	while i < num
		temp = curr
		curr = curr + prev
		prev = temp
		puts prev
		i+=1
	end
end

#fibs(5)

def fibs_rec(num)
	return 0 if num == 0
	return 1 if num == 1
	return fibs_rec(num - 1) + fibs_rec(num - 2)
end

puts fibs_rec(6)