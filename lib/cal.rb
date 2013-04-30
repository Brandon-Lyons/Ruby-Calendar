require_relative 'calendar'

mon = ARGV[0]
yr = ARGV[1]

cal = Month.new(mon, yr)
cal.display_single_month