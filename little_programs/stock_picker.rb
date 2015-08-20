def stock_picker(arr)
	difference, buy, sell = [0, 0 ,0]
	i = 0
	answer_array = []
	while i < arr.size
		j = i+1
			while j < arr.size
				curr_diff = arr[j] - arr[i]
				if difference < curr_diff
					difference = curr_diff
					buy = i 
					sell = j
				end
				j+=1
			end
		i+=1

	end
	answer_array[0] = buy
	answer_array[1] = sell

	return answer_array
end

p stock_picker([17,3,6,9,15,8,6,1,10])