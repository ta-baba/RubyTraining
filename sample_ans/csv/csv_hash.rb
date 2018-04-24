require "csv"
require "date"

# csvデータ読み込み
csv_data = CSV.read('timesheet201804.csv', headers: true)
# 作業時間格納ハッシュ
work_time_hash = {:SUN => 0,:MON => 0, :TUE => 0, :WED => 0, :TUH => 0, :FRI => 0, :SAT => 0}

  csv_data.each do |data|
    # 日付のデータ型に変換
    work_date = Date.strptime(data[0], '%Y/%m/%d')
    # 曜日を算出
    youbi = work_date.wday
    # 対応した曜日に作業時間を追加
    work_time_hash[:SUN] += data[3].to_f if youbi == 0
    work_time_hash[:MON] += data[3].to_f if youbi == 1
    work_time_hash[:TUE] += data[3].to_f if youbi == 2
    work_time_hash[:WED] += data[3].to_f if youbi == 3
    work_time_hash[:TUH] += data[3].to_f if youbi == 4
    work_time_hash[:FRI] += data[3].to_f if youbi == 5
    work_time_hash[:SAT] += data[3].to_f if youbi == 6
  end
puts "曜日別作業時間"

work_time_hash.each do |key, value|
  puts "#{key} #{value}"
end