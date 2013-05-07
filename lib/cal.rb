require_relative 'year'

if ARGV.empty?
  Month.new.display_single_month
elsif ARGV[1].nil?
  year = ARGV[0].to_i
  cal = Year.new(year)
  cal.display_year
else
  month = String.new(ARGV[0])
  year = ARGV[1].to_i
  cal = Month.new(month, year)
  cal.display_single_month
end
