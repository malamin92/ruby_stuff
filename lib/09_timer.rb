class Timer
	attr_accessor(:seconds, :minutes, :hours)

	def initialize
		@seconds = 0
		@minutes = 0
		@hours = 0
	end

	def time_string

		@hours = ((@seconds / 60) / 60) % 60
		@minutes = (@seconds / 60) % 60
		@seconds = (@seconds % 60)
		

		return ("#{"%02d" % @hours}:#{"%02d" % @minutes}:#{"%02d" % @seconds}")
	end
end