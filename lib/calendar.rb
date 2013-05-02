class Month
  attr_accessor :month
  attr_accessor :year

  # month = ARGV[0]
  # year = ARGV[1]


  def initialize (month, year)
    if (1..12).include? month.to_i
      @month = month.to_i
    else
      months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
      month.to_s
      month.capitalize!
      @month = months.index(month).to_i + 1
    end
    @year = year.to_i
    raise IndexError if @month.to_i < 1 || @month.to_i > 12 || @year.to_i < 1800 || @year.to_i > 3000
  end

  def month_and_year_header
    (month_header + " #{@year}").center(20).rstrip
  end

  def month_header
    month_name = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    month_name[@month - 1]
  end
  def week_row
    string = "Su Mo Tu We Th Fr Sa"
  end

  def zeller
    m = @month.to_i
    y = @year.to_i
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
    dates = []
    i = 0
    until i == zeller
      dates.unshift("  ")
      i += 1
    end
    dates += range
    dates
    # puts dates
  end

  def display_single_month
    string = month_and_year_header+ "\n" + week_row+ "\n"
    dates = format_range
    until dates.length == 0
      add = dates.slice!(0,7)
      string << add.join(" ")
      string << "\n"
    end
    until string.count("\n") >= 7
      string << "\n"
    end
    puts string
  end

end

