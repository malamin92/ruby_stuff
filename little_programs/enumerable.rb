module Enumerable
	def my_each
		return self unless block_given?
		i = 0
		while i < self.length
			yield(self[i])
			i+=1
		end
		return self
	end

	def my_each_with_index
		return self unless block_given?
		i = 0
		while i < self.length
			yield(slef[i], i)
		end
		return self
	end

	def my_select
		return self unless block_given?
		new_array = []
		self.my_each{|var| new_array << var if yield(var)}
		return new_array
	end

	def my_all?
		if block_given?
			self.my_each {|var| return false unless yield(var)}
		else 
			self.my_each {|var| return false unless var }
		end
		return true
	end

	def my_any?
		if block_given?
			self.my_each {|var| return true if yield(var)}
		else
			self.my_each {|var| return true if var}
		end
		return false
	end

	def my_none?
		if block_given?
			self.my_each {|var| return false if yield(var)}
		else
			self.my_each {|var| return false if var}
		end
		return true
	end

	def my_count
		count = 0
		if block_given?
			self.my_each {|var| count += 1 if yield(var)}
		else
			return self.length
		end
		return count
	end

	def my_map(proc)
		new_array = []
		self.my_each{|var| new_array << proc.call(var)}
		if block_given?
			i = 0
			while i < new_array.length
				new_array[i] = yield(new_array[i])
				i+=1
			end
		end
		return new_array
	end

	def my_inject (num = nil)
		if num.nil?
			num = self[0]
			self.my_each{|var| num = yield(var, num) if var != self[0]}
			return num
		else
			self.my_each{|var| num = yield(var, num)}

		end
	end

end
#end enum


def multiply_els(array)
	product = array.my_inject{|num, total| num *= total}
	return product
end

double = Proc.new {|var| var*2}

p [1,2,3,4].my_map(double){|num| num*2}
#puts multiply_els([2,4,5])

#p [2,4,5].my_inject{|num, total| puts num,total}

