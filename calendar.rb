def calc_day(yer, mnth, a = 1)
  # １をプラスする。
  if mnth == 1 || mnth == 2
    mnth += 12
    yer  -= 1
  end


  h = yer / 100
  y = yer % 100
  m = mnth

  # 曜日計算する。
  (y + (y / 4) + (h / 4) - (2 * h) + ((13 * (m + 1)) / 5) + a) % 7
end


# 返り値：うるう年ならtrue, 平年ならfalseを出す。
def leap_yer_judge(yer)
  case
  when (yer % 400).zero?
    true
  when (yer % 100).zero?
    false
  when (yer % 4).zero?
    true
  else
    false
  end
end


def print_date(yer_date, mnth, current_day)
  (1..yer_date[mnth]).each do |date|
    # 日にちを描画
    print format("%3d ", date)
    current_day += 1
    # 土曜にになったら改行
    if current_day % 7 == 0
      print "\n"
    end
  end
end

# カレンダーを表示する。
def show_calendar(yer, mnth, day)
  # うるう年じゃない年の日数（後で参照しやすいように0月の0日を設定）
  yer_days      = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  # うるう年の年の日数する。
  leap_yer_days = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  # ツェラーの公式の曜日だと扱いにくいから日曜を0にする
  # 土曜は6
  day -= 1
  day += 7 if day < 0


  # うるう年ならtrue, 平年ならfalse
  leap_yer_flag = leap_yer_judge(yer)

  puts "カレンダーを出力します(´・ω・｀)"
  puts "Sun Mon Tue Wed Thu Fri Sat"

  # 1日の位置を決める
  # 1日の曜日になるまでスペース表示
  day.times do
    print "    "
  end

  # うるう年かどうかで最終日が違ってくる（2月だけだけど…）
  if leap_yer_flag
    # 日にちを表示
    print_date(leap_yer_days, mnth, day)
  else
    print_date(yer_days, mnth, day)
  end
end


#ここから開始


puts "任意の年と月のカレンダーを表示します"

# 西暦を入力する。
print "西暦を入力してください : "
input_year = gets.to_i
# 月を入力する。
print "月を入力してください : "
input_mnth = gets.to_i

# 入力した年の月の曜日を計算する
first_day = calc_day(input_year, input_mnth)

# カレンダーを描画する。
show_calendar(input_year, input_mnth, first_day)
