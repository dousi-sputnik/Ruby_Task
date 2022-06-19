require "csv"

class Memo
    def make_memo
        puts "メモのタイトルを入力してください"
        title = gets.chomp.to_s
        puts "メモの本文を入力してください"
        content = gets.chomp.to_s
        memo = {"タイトル" => title, "本文" => content}
        memo_1 = memo["タイトル"] + ":" + memo["本文"]
        
            File.open("#{title}.csv", "w") do |text|
                text.puts(memo_1)
                title_name = "#{title}.csv"
            end
            number = 0
            while number == 0
                puts "追記をしますか？　するなら 0 しないなら　1 を記入してください"
                number = gets.chomp.to_i
                    if number == 1
                        puts "入力後、Ctrl + D で保存"
                        memo_7 = STDIN.read

                        CSV.open("title_name", "w") do |csv|
                            csv.puts ["#{memo_7}"]
                        end
                        puts "保存したので終了いたします、それではお元気で"
                        return number
                    end
                puts "追記してください"
                add_content = gets.chomp.to_s
                memo_4 = File.open("#{title}.csv", "a")
                memo_4.write(add_content)
                memo_4.close
            end
            if number == 1
                puts CSV.read("#{title}.csv")
            end
        
    end

    def show_memo(memos)
        puts "ファイル名を拡張子を除いて記述してください"
        title = gets.chomp.to_s
        memo_2 = CSV.read("#{title}.csv")
        puts memo_2
    end

    def edit_memo
        puts "ファイル名を拡張子を除いて記述してください"
        title = gets.chomp.to_s
        puts "メモの追記をして下さい"
        edit_content = gets.chomp.to_s
        memo_3 = File.open("#{title}.csv", "a")
        title_name = "#{title}.csv"
        memo_3.write(edit_content)
        
        memo_3.close
        number = 0
        while number == 0
            puts "追記をしますか？　するなら 0 しないなら　1 を記入してください"
            number = gets.chomp.to_i
                if number == 1
                    puts "入力後、Ctrl + D で保存"
                    memo_7 = STDIN.read

                    CSV.open("title_name", "w") do |csv|
                        csv.puts ["#{memo_7}"]
                    end
                    puts "保存したので終了いたします、それではお元気で"
                    return number
                end
            puts "追記してください"
            add_content = gets.chomp.to_s
            memo_5 = File.open("#{title}.csv", "a")
            memo_5.write(add_content)
            memo_5.close
        end
    end
end
memo = Memo.new
memos = []


puts "モード選択 add or show or edit"
mode = gets.chomp
if mode == "add"
    puts "メモを追加します"
    memos.push(memo.make_memo)
elsif mode == "show"
    puts "メモを表示します"
    memo.show_memo(memos)
elsif mode == "edit"
    puts "メモを編集（追記）します"
    memos.push(memo.edit_memo)
else
    puts "エラー"
end
