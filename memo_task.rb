require "csv"

class Memo
    def make_memo
        puts "メモのタイトルを入力してください"
        title = gets.chomp.to_s
        puts "メモの本文を入力してください　Ctrl + D で終了してください"
        
        inputs = readlines

        memo = {"タイトル" => title, "本文" => inputs}
        memo_1 = memo["タイトル"] 
        memo_2 = memo["本文"]
        
        File.open("#{title}.csv", "w") do |text|
            text.puts(memo_1)
            text.puts(memo_2)
            title_name = "#{title}.csv"
        end

        puts "_________"
        
        File.readlines("#{title}.csv").each do |line|
          p line.chomp
        end
        
    end


    def edit_memo
        puts "ファイル名を拡張子を除いて記述してください"
        title = gets.chomp.to_s
        puts "メモの追記をして下さい　Ctrl + D で終了してください"
        edit_content = readlines
        
        open("#{title}.csv", 'a') do |file|
            file.puts(edit_content)
        end

        puts "_________"

        File.open("#{title}.csv", "r") do |f|
            puts f.read
        end
        
    end
end

memo = Memo.new
memos = []


puts "半角入力　1(新規でメモを作成）2(既存のメモを編集する)"
memo_type = gets.to_i

if memo_type == 1
    puts "メモを追加します"
    memos.push(memo.make_memo)
elsif memo_type == 2
    puts "メモを編集（追記）します"
    memos.push(memo.edit_memo)
else
    puts "エラー"

end
