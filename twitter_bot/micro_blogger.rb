require 'jumpstart_auth'
require 'bitly'

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

  	def followers_list
  		screen_names = []
  		@client.followers.each do |follower|
  			screen_names << @client.user(follower).screen_name
  		end
  		screen_names
  	end

  	def spam_my_followers(message)
  		followers_list.each do |follower|
  			dm(follower, message)
  		end
  	end

  	def everyones_last_tweet
	    friends = @client.friends.collect { |friend| @client.user(friend)}
	    friends = friends.sort_by {|friend| friend.screen_name }
	    friends.each do |friend|
		    last_tweet = friend.status.text
		    timestamp = friend.status.created_at
		    timestamp.strftime("%A, %b %d")
		    puts "\n"
		    puts friend.screen_name + " on #{timestamp}"
		    puts last_tweet
	    end
  	end

  	def shorten(original_url)
    puts "Shortening this URL: #{original_url}"
    Bitly.use_api_version_3
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    return bitly.shorten(original_url).short_url
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
	  			when "spam" then
	  				spam_my_followers(parts[1..-1].join(" "))
	  			when "elt" then
	  				everyones_last_tweet
	  			when 's' then 
	  				puts shorten(parts[1..-1].join(" "))
	  			when 'turl' then 
	  				tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
	  			else
	  				puts "Sorry, I don't know how to '#{command}'."
  			end
  		end
  	end

  	

end

blogger = MicroBlogger.new
i=1
while i <= 99
	blogger.tweet("#{i.to_s} voting for #fouseyTUBE for SHOW OF THE YEAR at the #STREAMYS")
	i += 1
end
