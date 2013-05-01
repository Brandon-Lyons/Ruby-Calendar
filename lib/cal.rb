require_relative 'calendar'
# require 'year'

mon = String.new(ARGV[0])
yr = String.new(ARGV[1])

cal = Month.new(mon, yr)
cal.display_single_month

# if yr.nil? && mon.size >= 4
# 	cal = Year.new(mon)
# 	cal.display_year
# else
# 	cal = Month.new(mon, yr)
# 	cal.display_single_month
# end
