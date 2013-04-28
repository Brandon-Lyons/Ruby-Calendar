require 'test/unit'
require 'cal'

class CalTests < Test::Unit::TestCase

	def test_header
		cal = Calendar.new(2, 2012)
		assert_equal("February 2012\n", cal.header)
	end

	def test_header_different_month
		cal = Calendar.new(5, 1896)
		assert_equal("May 1896\n", cal.header)
	end

	def test_no_month
		cal = Calendar.new(1956)
		assert_raise ArgumentError do 
			cal.header
		end
	end

	def test_week_row
		cal = Calendar.new(2, 2012)
		assert_equal("February 2012\nSu Mo Tu We Th Fr Sa\n", cal.week_row)
	end

	# def test_final_integration
	# 	assert_equal `cal 2 2013`, `ruby cal.rb 2 2013`
	# end

end