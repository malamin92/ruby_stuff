class Timer
	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def time_string

		@hours = @seconds/(60*60) #hours is = @seconds / (60*60)
		@minutes = (@seconds/60) % 60 # minutes = seconds/60 (to get actual minutes) % 60 (get the remainder of dividing the minutes)
		@seconds = @seconds % 60 #seconds is the remainder of seconds / 60

		return "#{"%02d" % @hours}:#{"%02d" % @minutes}:#{"%02d" % @seconds}"
	end
end