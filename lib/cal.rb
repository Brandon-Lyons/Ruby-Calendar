class Calendar
	attr_accessor :month
	attr_accessor :year
	attr_accessor :output

	month_name = { 1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December" }


	def initialize (month, year)
		@month = month
		@year = year
	end

	def header
		@output = "#{month_name[@month]} #{year}\n"
	end

	def week_row
		header
		@output = @output << "Su Mo Tu We Th Fr Sa\n"
	end


end
