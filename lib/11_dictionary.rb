class Dictionary
  # TODO: your code goes here!
  attr_accessor :entries

  def initialize
  	@entries = {}
  end

  def add(hash)

  	if hash.is_a?String
  		@entries[hash] = nil
  	else
	  	hash.each do |key, val|
	  		@entries[key] = val
	  	end
	  end
  end

  def keywords
  	@entries.keys.sort
  end

  def include?(key)
  	if @entries.has_key?(key)
  		return true
  	else
  		return false
  	end
  end

  def find(key)
  	matches = {}
  	@entries.each do |word, definition|
  		if word =~ /#{key}/
  			matches[word] = definition
  		end
  	end
  	return	matches
  end

  def printable
  	str = @entries.collect do |key, val|
  		"[#{key}] \"#{val}\""
  	end

  	return str.sort.join("\n")
  end

end
