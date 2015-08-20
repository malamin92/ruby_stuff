class Array
	def sum
		total = 0
		if self.empty?
			return 0
		else
			self.each do |elem|
				total += elem
			end
		end
		return total
	end

	def square
		if self.empty?
			return []
		else
			self.collect{|elem| elem**2}
		end
	end

	def square!
		self.collect!{|elem| elem**2}
	end

end