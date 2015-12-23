require 'minitest/autorun'

module Luhn
  def self.is_valid?(number_in)
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

    luhn
  end
end

class TestLuhn < MiniTest::Unit::TestCase

  def test_luhn_valid
    assert Luhn.is_valid?(4194560385008504)
  end

  def test_luhn_invalid
    assert ! Luhn.is_valid?(4194560385008505)
  end

  def test_luhn_valid2
    assert Luhn.is_valid?(377681478627336), "Check step two: Did you start at the right?"
  end

  def test_luhn_invalid2
    assert ! Luhn.is_valid?(377681478627337), "Check step two: Did you start at the right?"
  end

end