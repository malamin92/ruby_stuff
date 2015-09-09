def mergesort(arr)
	return arr if arr.size < 2
	mid = arr.length/2
	first_half = mergesort(arr[0..mid-1])
	second_half = mergesort(arr[mid..-1])
	sorted = []

	while first_half.size > 0 && second_half.size > 0
		first_half[0] < second_half[0] ? sorted << first_half.shift : sorted << second_half.shift
	end

	sorted.concat(first_half) if first_half.size > 0
	sorted.concat(second_half) if second_half.size > 0
	sorted
end

p mergesort([34,126,34,1,55,7,10,843])