def change_calculator(change)
	answer_hash = Hash.new(0)

	quarters = change / 25; change -= quarters * 25
	answer_hash[:quarters] = quarters

	dimes = change / 10; change -= dimes * 10
	answer_hash[:dimes] = dimes

	nickels = change / 5; change -= nickels * 5
	answer_hash[:nickles] = nickels

	answer_hash[:pennies] = change

	answer_hash

end

p change_calculator(97)