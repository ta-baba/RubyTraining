class WorkTime
  require "csv"
  require "date"

  def sum_array
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
  end

  def sum_hash
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
    # 結果出力
    puts "曜日別作業時間"
    work_time_hash.each do |key, value|
      puts "#{key} #{value}"
    end
  end

end
