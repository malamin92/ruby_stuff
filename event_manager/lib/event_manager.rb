require "erb"
require "csv"
require "sunlight/congress"

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5, "0")[0..4]
end

def legislators_by_zipcode(zipcode)
	Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letter(id, form_letter)
	Dir.mkdir("output") unless Dir.exists?("output")

	filename = "output/thanks_#{id}.html"

	File.open(filename, "w") do |file|
		file.puts form_letter
	end
end


puts "Event manager Initialized!"

contents = CSV.open("event_attendees.csv", headers: true, header_converters: :symbol)

template_letter = File.read "form_letter.erb"
erb_template = ERB.new(template_letter)

contents.each do |row|

	id = row[0]
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	legislators = legislators_by_zipcode(row[:zipcode])

	form_letter = erb_template.result(binding)

	save_thank_you_letter(id, form_letter)

end















#the following are ways of accessing a file in ruby, but are not ideal
#because ruby alreay has a CSV parser that is more convinient and useful that writing our own parser
=begin
contents = File.read "event_attendees.csv"
puts contents

--------------------------------------------

lines = File.readlines("event_attendees.csv")
lines.each_with_index do |line, index|
	next if index == 0
	columns = line.split(",")
	name = columns[2]
	puts name
end
=end

#this was the original version of clean_zipcode which was refractored
=begin
def clean_zipcode(zipcode)
	if zipcode.nil?
		zipcode = "00000"
	elsif zipcode.length < 5
		zipcode = zipcode.rjust(5, "0")
	elsif zipcode.length > 5
		zipcode = zipcode[0..4]
	end
end
=end