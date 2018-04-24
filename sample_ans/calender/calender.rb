class Calender

  require "date"

  def main
    p "カレンダーを出したい年月を入力してください"
    g = gets.chomp
    input_month = Date.strptime(g, "%Y-%m")
    youbi = ["SUN", "MAN", "TUE", "WED", "THU", "FRI", "SAT"]
    month_name = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    year = input_month.year
    next_month = input_month >> 1
    month_day = []
    week = Array.new(7, "")
    text = month_name[input_month.month]
    month_day << youbi

    while input_month < next_month  do 
      week[input_month.wday] = input_month.day.to_s
      if input_month.wday == 6
        month_day << week
        week = Array.new(7, "")
      end
      input_month += 1
    end
    month_day << week

    p "#{text}, #{year}".center(30)
    month_day.each do |e|
      e.each do |f|
        print f.rjust(4)
      end
      puts ""
    end
  end
end

cl = Calender.new
cl.main