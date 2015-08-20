class Temperature
  # TODO: your code goes here!
  def initialize(opts = {})
  	if opts.has_key?(:f)
  		@ftemp = opts[:f] 
  	else opts.has_key?(:c)
  		@ftemp = opts[:c] * 1.8 + 32
  	end
  end

  def in_fahrenheit
  	@ftemp
  end

  def in_celsius
  	@ctemp = (@ftemp - 32) * (5.0/9.0)
  	return @ctemp
  end

  def self.from_celsius(temp)
  	new(:c => temp)
  end

  def self.from_fahrenheit(temp)
  	new(:f => temp)
  end

end

class Celsius < Temperature
	def initialize(cel)
		super(:c => cel)
	end
end

class Fahrenheit < Temperature
	def initialize(fah)
		super(:f => fah)
	end
end

