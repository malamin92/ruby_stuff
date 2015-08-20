def buble_sort(list)
	n = list.length
	swapped = true
	while swapped
		swapped = false
		i = 1
		while i <  n
			if list[i-1] > list[i]
				list[i-1], list[i] = list[i], list[i-1]
				swapped = true
			end 
			i += 1
		end
		n -= 1
	end
	return list
end

def buble_sort_by(list)
	n = list.length
	swapped = true
	while swapped
		swapped = false
		i = 1
		while i <  n
			diff = yield(list[i-1], list[i])
			if diff > 0
				list[i-1], list[i] = list[i], list[i-1]
				swapped = true
			end 
			i += 1
		end
		n -= 1
	end
	return list
end


p buble_sort([4,3,78,2,0,2])

p buble_sort_by(["hi","hello","hey"]){|one, two| one.length - two.length}


