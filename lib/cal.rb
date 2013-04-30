require_relative 'calendar'

mon = ARGV[0].to_i
yr = ARGV[1].to_i

cal = Calendar.new(mon, yr)
cal.display