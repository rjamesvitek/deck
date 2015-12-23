def test_luhn?(number_in)

	number_digits = []
	number = number_in.to_s.split("")
	number.each do |x|
		number_digits << x.to_i
	end

	digit_increment = number_digits.length - 1
	count = 1

	number_digits_times_two = []

	number_digits.length.times do
		if count == 1 || count % 2 != 0
			number_digits_times_two[digit_increment] = number_digits[digit_increment]
		else
			if 2 * (number_digits[digit_increment]) > 9
				number_digits_times_two[digit_increment] = (2 * (number_digits[digit_increment])) - 9
			else
				number_digits_times_two[digit_increment] = 2 * (number_digits[digit_increment])
			end
		end

		count += 1
		digit_increment -= 1
	end

	digit_sum = 0
	number_digits_times_two.each do |x|
		digit_sum += x
	end

	if digit_sum % 10 == 0
		luhn = true
	else
		luhn = false
	end
	
	if luhn == true
		luhn = "Valid"
	else
		luhn = "Invalid"
	end
	luhn
end

x = 377681478627337

puts test_luhn?(x)




