require "csv"
require "date"

# csvデータ読み込み
csv_data = CSV.read('timesheet201804.csv', headers: true)
# 作業時間格納配列
work_time_array = Array.new(7, 0)
# 曜日格納配列
youbi_array= ["SUN","MON","TUE","WED","THU","FRI","SAT"]

  csv_data.each do |data|
    # 日付のデータ型に変換
    #work_date = Date.strptime(data[0], '%Y/%m/%d')
    # 曜日を算出
    #youbi = work_date.wday
    # 対応した曜日に作業時間を追加
    #work_time_array += data[3].to_f
    # 上記の処理を一括でやった
    work_time_array[Date.strptime(data[0], '%Y/%m/%d').wday] += data[3].to_f
  end
puts "曜日別作業時間"

7.times do |n|
  puts "#{youbi_array[n]} #{work_time_array[n]}"

end