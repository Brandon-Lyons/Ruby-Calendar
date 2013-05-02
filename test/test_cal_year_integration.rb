require 'test/unit'
require 'year'

class YearIntegrationTests < Test::Unit::TestCase
  def test_final_year_integration
    assert_equal (`cal 2013`, `ruby lib/cal.rb 2013`)
  end

  def test_final_year_integration_leap_year
    assert_equal (`cal 1996`, `ruby lib/cal.rb 1996`)
  end

  def test_final_year_integration_leap_century
    assert_equal (`cal 2000`, `ruby lib/cal.rb 2000`)
  end

  def test_final_year_integration_leap_year_not_leap_century
    assert_equal (`cal 1900`, `ruby lib/cal.rb 1900`)
  end

end