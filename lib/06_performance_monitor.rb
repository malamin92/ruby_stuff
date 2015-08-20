def measure(num=1)
	start = Time.now
	num.times do
		yield
	end
	return (Time.now - start) / num
end