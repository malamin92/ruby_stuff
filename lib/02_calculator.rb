def add (one,two)
	return one + two
end

def subtract(one,two)
	return one - two
end

def sum(array)
	return 0 if array.empty?
	array_total = 0
	array.each do |add_this|
		array_total += add_this
	end
	return	array_total
end

def multiply(one, two)
	return one*two
end

def multiply_array(array)
	total_product = 1
	array.each do |num|
		total_product *= num
	end
	return total_product
end

def power(number, power)
	return number**power
end

def factorial(num)
	return 0 if num == 0
	return 1 if num == 1
	return num * factorial(num - 1)
end