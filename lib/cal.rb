require_relative 'calendar'

mon = ARGV[0]
yr = ARGV[1]

cal = Calendar.new(mon, yr)
cal.display