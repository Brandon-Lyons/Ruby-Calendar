require_relative 'calendar'

class Year

  def initialize (year)
    @year = year
  end

  def header
    string = "#{@year}".center(64).rstrip + "\n"
    string
  end

  def week_row
    week = "Su Mo Tu We Th Fr Sa"
    string = week + "  " + week + "  " + week + "\n"
    string
  end

  def month_array
    months = []
    (1..12).each do |month|
      cal = Month.new(month, @year)
      months << cal.month_header
    end
    months
  end

  def days_array(month)
    cal = Month.new(month, @year)
    days_array = cal.format_days
    days_array
  end

  def calc_trailing(array)
    n = array.length
    spaces = []
    number = 7 - n
    number.times do
      spaces << ("  ")
    end
    spaces
  end

  def empty_lines(months)
    space = (" ") * (22 * months)
    space
  end

  def format_3_months(a, b, c)
    string = ""
    month1 = days_array(a)
    month2 = days_array(b)
    month3 = days_array(c)
    until month1.empty? && month2.empty? && month3.empty?
      week1 = month1.shift(7)
      week2 = month2.shift(7)
      week3 = month3.shift(7)
      if month1.nil? && month2.nil?
        string << empty_lines(2)
        string << (week3 + calc_trailing(week3)).join(" ") + "\n"
      elsif month1.nil?
        string << empty_lines(1)
        string << (week2 + calc_trailing(week2)).join(" ")
        string << (week3 + calc_trailing(week3)).join(" ") + "\n"
      else
        string << (week1 + calc_trailing(week1)).join(" ") + "  "
        string << (week2 + calc_trailing(week2)).join(" ") + "  "
        string << (week3 + calc_trailing(week3)).join(" ") + "\n"
      end
    end
    string
  end

  def display_year
    string = header
    a, b, c = 1, 2, 3
    4.times do
      string << month_array[a - 1].center(20) + "  "
      string << month_array[b - 1].center(20) + "  "
      string << month_array[c - 1].center(20) + "\n"
      string << week_row
      string << format_3_months(a,b,c) + "\n"
      a += 3
      b += 3
      c += 3
    end
    puts string
  end

end



