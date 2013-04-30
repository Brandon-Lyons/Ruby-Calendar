require 'test/unit'
require 'calendar'

class CalTests < Test::Unit::TestCase

	def test_header
		cal = Calendar.new(5, 2012)
		assert_equal("      May 2012      \n", cal.header)
	end

	def test_header_different_month
		cal = Calendar.new(5, 1896)
		assert_equal("      May 1896      \n", cal.header)
	end

	# def test_no_month
	# 	cal = Calendar.new(1956)
	# 	assert_raise ArgumentError do 
	# 		cal.header
	# 	end
	# end

	def test_week_row
		cal = Calendar.new(5, 2012)
		assert_equal("      May 2012      \nSu Mo Tu We Th Fr Sa\n", cal.week_row)
	end

	def test_zeller_congruence
		cal = Calendar.new(3, 1995)
		assert_equal(3, cal.zeller)
	end

	def test_zeller_again
		cal = Calendar.new(6, 2999)
		assert_equal(6, cal.zeller)
	end

	def test_zeller_january
		cal = Calendar.new(1, 2000)
		assert_equal(6, cal.zeller)
	end

	def test_zeller_february
		cal = Calendar.new(2, 2000)
		assert_equal(2, cal.zeller)
	end

	def test_number_of_days
		cal = Calendar.new(6, 1900)
		assert_equal(30, cal.days_number)
	end

	def test_number_of_days_february
		cal = Calendar.new(2, 1995)
		assert_equal(28, cal.days_number)
	end

	def test_number_of_days_leap_year
		cal = Calendar.new(2, 1996)
		assert_equal(29, cal.days_number)
	end

	def test_number_of_days_leap_century
		cal = Calendar.new(2, 2000)
		assert_equal(29, cal.days_number)
	end

	def test_number_of_days_non_leap_century
		cal = Calendar.new(2, 1900)
		assert_equal(28, cal.days_number)
	end

	def test_month_format
		cal = Calendar.new(2, 1990)
		assert_equal([" 1"," 2"," 3"," 4"," 5"," 6"," 7"," 8"," 9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28"], cal.format_range)
	end

	def test_final_output
		cal = Calendar.new(5, 1995)
		assert_equal("      May 1995      \nSu Mo Tu We Th Fr Sa\n    1  2  3  4  5  6\n 7  8  9 10 11 12 13\n14 15 16 17 18 19 20\n21 22 23 24 25 26 27\n28 29 30 31", cal.display)
	end
	# def test_first_line
	# 	cal = Calendar.new(5, 1990)
	# 	assert_equal("      May 1990      \nSu Mo Tu We Th Fr Sa\n       1", cal.first_line)
	# end


	# def test_final_integration
	# 	assert_equal `cal 2 2013`, `ruby cal.rb 2 2013`
	# end

end