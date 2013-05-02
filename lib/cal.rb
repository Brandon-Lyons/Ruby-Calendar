require_relative 'year'

if ARGV[1].nil?
  year = ARGV[0].to_i
  cal = Year.new(year)
  cal.display_year
else
  mon = String.new(ARGV[0])
  yr = ARGV[1].to_i
  cal = Month.new(mon, yr)
  cal.display_single_month
end
