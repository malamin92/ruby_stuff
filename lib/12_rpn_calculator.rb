class RPNCalculator
  # TODO: your code goes here!

  attr_accessor :stack

  def initialize
  	@stack = []
  end

  def push(num)
  	stack.push(num)
  end

  def plus
  	if @stack.length < 2
  		raise "calculator is empty"
  	else
	  	num1 = @stack.pop.to_f
	  	num2 = @stack.pop.to_f
	  	sum = num1 + num2
	  	@stack << sum
	end
  end

  def minus
  	if @stack.length < 2
  		raise "calculator is empty"
  	else
	  	diff = 0
	  	num2 = @stack.pop.to_f
	  	num1 = @stack.pop.to_f
	  	diff = num1 - num2
	  	@stack << diff
  	end
  end

  def divide
  	if @stack.length < 2
  		raise "calculator is empty"
  	else
	  	denom = @stack.pop.to_f
	  	numer = @stack.pop.to_f
	  	quo = numer/denom
	  	@stack << quo
  	end
  end

  def times
  	if @stack.length < 2
  		raise "calculator is empty"
  	else
	  	num1 = @stack.pop.to_f
	  	num2 = @stack.pop.to_f
	  	prod = num1 * num2
	  	@stack << prod
  	end
  end

  def value
  	return @stack.last.to_f
  end

  def tokens(str)
  	a = str.split.collect do |elem|
  		if elem =~ /[\+\-\*\/]/
  			elem.to_sym
  		else
  			elem.to_i
  		end
  	end
  	return a
  end

  def evaluate(str)
    tokens(str).each do |elem|
	    case elem
		    when :+
		    	plus
		    when :-
		        minus
		    when :*
		        times
		    when :/
		        divide
		    else
		        push elem
		    end		
	    end
    value
  end


end
