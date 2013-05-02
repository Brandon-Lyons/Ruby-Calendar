require 'test/unit'
require 'calendar'

class CalUnitTests < Test::Unit::TestCase

  def test_header
    cal = Month.new(5, 2012)
    assert_equal("      May 2012", cal.header)
  end

  def test_header_different_month
    cal = Month.new(5, 1896)
    assert_equal("      May 1896", cal.header)
  end

  # def test_month_not_in_range
  #   cal = Month.new(13, 2000)
  #   assert_raise IndexError do
  #     cal.header
  #   end
  # end

  def test_week_row
    cal = Month.new(5, 2012)
    assert_equal("Su Mo Tu We Th Fr Sa", cal.week_row)
  end

  def test_zeller_congruence
    cal = Month.new(3, 1995)
    assert_equal(3, cal.zeller)
  end

  def test_zeller_again
    cal = Month.new(6, 2999)
    assert_equal(6, cal.zeller)
  end

  def test_zeller_january
    cal = Month.new(1, 2000)
    assert_equal(6, cal.zeller)
  end

  def test_zeller_february
    cal = Month.new(2, 2000)
    assert_equal(2, cal.zeller)
  end

  def test_number_of_days
    cal = Month.new(6, 1900)
    assert_equal(30, cal.days_number)
  end

  def test_number_of_days_february
    cal = Month.new(2, 1995)
    assert_equal(28, cal.days_number)
  end

  def test_number_of_days_leap_year
    cal = Month.new(2, 1996)
    assert_equal(29, cal.days_number)
  end

  def test_number_of_days_leap_century
    cal = Month.new(2, 2000)
    assert_equal(29, cal.days_number)
  end

  def test_number_of_days_non_leap_century
    cal = Month.new(2, 1900)
    assert_equal(28, cal.days_number)
  end

  def test_month_format
    cal = Month.new(2, 1990)
    assert_equal(["  ","  ","  ","  "," 1"," 2"," 3"," 4"," 5"," 6"," 7"," 8"," 9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28"], cal.format_range)
  end


end