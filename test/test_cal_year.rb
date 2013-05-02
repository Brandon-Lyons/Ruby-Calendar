require 'test/unit'
require 'year'

class YearUnitTests < Test::Unit::TestCase

  def test_year_header
    cal = Year.new(2012)
    assert_equal("                              2012\n", cal.header)
  end

  def test_month_array
    cal = Year.new(2012)
    assert_equal(["January","February","March","April","May","June","July","August","September","October","November","December"], cal.month_rows)
  end

  def test_days_array
    cal = Year.new(2012)
    assert_equal([" 1"," 2"," 3"," 4"," 5"," 6"," 7"," 8"," 9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"], cal.days_array(1))
  end

  def test_first_row_of_format
    cal = Year.new(2012)
    string = <<-TEST
 1  2  3  4  5  6  7            1  2  3  4               1  2  3
     TEST
     assert_equal(string, cal.format_first_row(1,2,3))
   end

   def test_format_first_3_months
    cal = Year.new(2012)
    string = <<-TEST
 1  2  3  4  5  6  7            1  2  3  4               1  2  3
 8  9 10 11 12 13 14   5  6  7  8  9 10 11   4  5  6  7  8  9 10
15 16 17 18 19 20 21  12 13 14 15 16 17 18  11 12 13 14 15 16 17
22 23 24 25 26 27 28  19 20 21 22 23 24 25  18 19 20 21 22 23 24
29 30 31              26 27 28 29           25 26 27 28 29 30 31
TEST
    assert_equal(string, cal.format_3_months(1,2,3))
  end

def test_calc_trailin_output
  cal = Year.new(2012)
  array = cal.days_array(1).shift(2)
  assert_equal(["  ","  ","  ","  ","  "], cal.calc_trailing(array))
end
end