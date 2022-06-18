require "csv"

def make_memo
    puts "メモのタイトルを入力してください"
    title = gets.chomp
    puts "メモの本文を入力してください"
    content = gets.chomp
    memo = {"タイトル" => title, "本文" => content}
    memo_1 = memo["タイトル"] + ":" + memo["本文"]

    File.open("memo.csv", "w") do |text|
        text.puts(memo_1)
    end
    puts CSV.read("memo.csv")
    
end

def show_memo(memos)
    memo_2 = CSV.read("memo.csv")
    puts memo_2
end

memos = []


puts "モード選択 add or show"
mode = gets.chomp
if mode == "add"
    puts "メモを追加します"
    memos.push(make_memo)
elsif mode == "show"
    puts "メモを表示します"
    show_memo(memos)
else
    puts "エラー"
end
