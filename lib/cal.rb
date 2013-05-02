require_relative 'year'

if ARGV[1].nil?
  year = String.new(ARGV[0])
  cal = Year.new(year)
  cal.display_year
else
  mon = String.new(ARGV[0])
  yr = String.new(ARGV[1])
  cal = Month.new(mon, yr)
  cal.display_single_month
end
