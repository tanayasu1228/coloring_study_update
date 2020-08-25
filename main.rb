# 色をつけるgemを使用
require 'colorize'

# 入力された学習項目・時間をもとに、学習記録を保持するハッシュstudy_listsを更新するメソッド
def update_lists(input_subject, input_time, study_lists)
  input_subject.downcase!
  if study_lists.key?(input_subject)
    study_lists[input_subject] += input_time
  else
    study_lists[input_subject] = input_time
  end
end

# 学習記録を保持するハッシュstudy_listsをもとに、学習記録をターミナルへ出力し表示するメソッド。
def result_lists(study_lists)
  puts "====== 学習記録 ======"
  puts ""
  study_lists.each{|subject, time|
    coloring_blocks = ""
    (time/15).times {
      coloring_blocks << "■ "
    }
    puts "#{subject} #{coloring_blocks.green}"
  }
  puts ""
  puts "======================"
end

# メイン処理の実行パート
def main_process
  study_lists = {}
  loop do
    puts "今日はどこの項目を何時間勉強しましたか？"
    print "学習項目を入力してください >"
    input_subject = gets.chomp
    print "学習時間を入力してください（単位：分） >"
    input_time = gets.chomp.delete("^0-9").to_i

    update_lists(input_subject, input_time, study_lists)
    result_lists(study_lists)

    puts <<~TEXT
  
    引き続き入力しますか？
    YES -> y
    No -> n
    TEXT
    print "選択を入力 ＞"

    answer = gets.chomp
    break if answer == "n"
  end
end

main_process