class Calendar
	attr_accessor :month
	attr_accessor :year
	attr_accessor :output

	# month = ARGV[0]
	# year = ARGV[1]


	def initialize (month, year)
		@month = month.to_i
		@year = year.to_i
	end

	def header
		raise IndexError if month.to_i < 1 || month.to_i > 12 || year.to_i < 1800 || year.to_i > 3000
		month_name = ["January","February","March","April","May","June","July","August","September","October","November","December"]
		string = "#{month_name[@month - 1]} #{@year}".center(20) << "\n"
		string << "Su Mo Tu We Th Fr Sa\n"
		string
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
		first_day = ((1 + (((m + 1) * 26) / 10) + y + (y / 4) + 6 * (y / 100) + (y / 400)) % 7) - 1
		first_day = 6 if first_day == -1
		first_day
	end

	def days_number
		thirty = [4,6,9,11]
		thirtyone = [1,3,5,7,8,10,12]
		return 30 if thirty.include? @month
		return 31 if thirtyone.include? @month
		if @year % 100 == 0 && @year % 400 == 0
			29
		elsif @year % 4 == 0 && @year % 100 != 0
			29
		else
			28
		end					
	end

	def format_range
		range = (1..days_number).to_a
		range.collect! do |num|
			if num < 10
				" " + num.to_s
			else
				num.to_s
			end
		end
		range
		dates = []
		i = 0
		until i == zeller
			dates.unshift("  ")
			i += 1
		end
		dates += range
		string = ""
		until dates.length == 0
			add = dates.shift(7)
			string << add.join(" ")
			string << "\n"
		end
		string
	end

	def display
		string = header + format_range
		puts string
	end

end

