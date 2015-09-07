require 'jumpstart_auth'

class MicroBlogger
	attr_accessor :client

	def initialize
	    puts "Initializing..."
	    @client = JumpstartAuth.twitter
  	end

  	def tweet(message)
  		if message.length > 140
  			puts "Warning: Tweet exceeds 140 characters."
  		else
  			@client.update(message)
  		end
  	end

	def dm(target, message)
		screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
		puts "Trying to send #{target} this direct message:"
  		if screen_names.include?(target)
	  		puts message
	  		message = "@#{target} #{message}"
	  		tweet(message)
	  	else
	  		puts "You can only dm people who follow you."
	  	end
  	end

  	def run
  		puts "Welcome to the JSL Twitter Client."
  		command = ""
  		while command != "q"
  			printf "Enter Command: "
  			input = gets.chomp
  			parts = input.split(" ")
  			command = parts[0]
  			case command
	  			when "q" then 
	  				puts "Goodbye!"
	  			when "t" then
	  				tweet(parts[1..-1].join(" "))
	  			when "dm" then
	  				dm(parts[1], parts[2..-1].join(" "))
	  			else
	  				puts "Sorry, I don't know how to '#{command}'."
  			end
  		end
  	end

  	

end

blogger = MicroBlogger.new
blogger.run