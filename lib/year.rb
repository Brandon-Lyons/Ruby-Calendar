require_relative 'calendar'

class Year
  attr_accessor :year
  attr_accessor :calendar


  def initialize (year)
    @year = year
    @calendar = []
    # (1..12).to_a.each do |month|
    #   months = Month.new(month, @year)
    #   @calendar.push(months.display_single_month)
    # end
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

  # def month_row
  #   array = month_array
  #   string =""




  def days_array(month)
    cal = Month.new(month, @year)
    days_array = cal.format_range
    days_array
  end

  def calc_trailing(array)
    n = array.length
    spaces = []
    if n < 7
      number = 7 - n
    end
    number.to_i.times do
      spaces << ("  ")
    end
    spaces
  end

  def empty_lines(months)
    space = (" ") * (22 * months)
    space
  end

  def format_first_row(a, b, c)
    string = ""
    month1 = days_array(a)
    month2 = days_array(b)
    month3 = days_array(c)
    # until month1.nil? && month2.nil? && month3.nil?
      add1 = month1.shift(7).join(" ")
      add2 = month2.shift(7).join(" ")
      add3 = month3.shift(7).join(" ")
      string << add1 + "  " + add2 + "  " + add3 + "\n"
      string
    end

    def format_3_months(a, b, c)
      string = ""
      month1 = days_array(a)
      month2 = days_array(b)
      month3 = days_array(c)
      until month1.length == 0 && month2.length == 0 && month3.length == 0
        add1 = month1.shift(7)
        add2 = month2.shift(7)
        add3 = month3.shift(7)
        if month1.length >= 7 && month2.length >= 7 && month3.length >= 7
          string << add1.join(" ") + "  " + add2.join(" ") + "  " + add3.join(" ") + "\n"
        elsif month1.nil? && month2.nil?
          string << empty_lines(2) + (add3 + calc_trailing(add3)).join(" ") + "\n"
        elsif month1.nil?
          string << empty_lines(1) + (add2 + calc_trailing(add2)).join(" ") + (add3 + calc_trailing(add3)).join(" ") + "\n"
        else
          string << (add1 + calc_trailing(add1)).join(" ") + "  " + (add2 + calc_trailing(add2)).join(" ") + "  " + (add3 + calc_trailing(add3)).join(" ") + "\n"
        end
      end
      string
    end

    def display_year
      string = header
      a = 1
      b = 2
      c = 3
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



