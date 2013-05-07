class Month

  TIME = Time.now

  def initialize (month = TIME.month, year = TIME.year)
    if (1..12).include? month.to_i
      @month = month.to_i
    elsif month != 0
      months = %w{jan feb mar apr may jun jul aug sep oct nov dec}
      month.downcase!
      search = month[0,3]
      @month = months.index(search).to_i + 1
    end
    @year = year.to_i
    raise IndexError unless (1..12).include?(@month) && (1800..3000).include?(@year)
  end

  def month_header
    month_name = %w{January February March April May June July August September October November December}
    month_name[@month - 1]
  end

  def month_and_year_header
    (month_header + " #{@year}").center(20).rstrip
  end


  def week_row
    "Su Mo Tu We Th Fr Sa"
  end

  def zeller
    m = @month.to_i
    y = @year.to_i
    if @month == 1 || @month == 2
      m = @month + 12
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
    return 29 if @year % 400 == 0 || (@year % 4 ==0 && @year % 100 != 0)
    28
  end

  def format_days
    days = (1..days_number).to_a
    days.collect! do |num|
      num < 10 ? " " + num.to_s : num.to_s
    end
    zeller.times do
      days.unshift("  ")
    end
    days
  end

  def display_single_month
    string = month_and_year_header+ "\n" + week_row+ "\n"
    dates = format_days
    until dates.empty?
      week = dates.shift(7)
      string << week.join(" ")
      string << "\n"
    end
    until string.count("\n") >= 7
      string << "\n"
    end
    puts string
  end

end

