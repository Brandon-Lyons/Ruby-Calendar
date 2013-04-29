class Calendar
	attr_accessor :month
	attr_accessor :year
	attr_accessor :days
	attr_accessor :first_day
	attr_accessor :output

	# month = ARGV[0]
	# year = ARGV[1]


	def initialize (month, year)
		@month = month
		@year = year
	end

	def header
		month_name = { 1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December" }
		@output = "#{month_name[@month]} #{year}".center(20) << "\n"
	end

	def week_row
		header
		@output = @output << "Su Mo Tu We Th Fr Sa\n"
	end

	def zeller
		m = @month
		y = @year
		if @month == 1
			m = 13
			y = @year - 1
		elsif @month == 2
			m = 14
			y = @year - 1
		end
				
		@first_day = ((1 + (((m + 1) * 26) / 10) + y + (y / 4) + 6 * (y / 100) + (y / 400)) % 7) - 1

		if @first_day == -1
			@first_day = 6
		end

		@first_day
	end

	def days_number
		num_days = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31 }
		@days = num_days[@month]
		if @year % 100 == 0 && @year % 400 == 0
			num_days[2] = 29
		elsif @year % 4 == 0 && @year % 100 != 0
			num_days[2] = 29
		end					
		@days = num_days[@month]
		@days
	end

	def format_range
		days_number
		format = (1..@days).to_a
		format
	end

	def first_line
		week_row
		zeller
		@output << " " * ((@first_day * 3) + 1)
		@output << "1"
		@output
	end


end
