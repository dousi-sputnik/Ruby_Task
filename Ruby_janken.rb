class Janken
    def ja_rule
        puts "出さなきゃ負けよ、じゃんけんポイ！"
        puts "[0]グー\n[1]チョキ\n[2]パー"

        human_choice = gets.to_i
        cp_choice = rand(3)

        jankens = ["グー", "チョキ","パー"]
        puts "人類:#{jankens[human_choice]}, cp:#{jankens[cp_choice]}"
        @human_choice = human_choice
        @cp_choice = cp_choice
    end

    def ja_now
        if @human_choice == @cp_choice
            puts "あいこです、もう一度お願いします"
            return 0
        elsif(@human_choice == 0 && @cp_choice == 1) || (@human_choice == 1 && @cp_choice == 2) || (@human_choice == 2 && @cp_choice == 0)
            puts "人類の勝利です"
            ja_game = 1
            return ja_game
        else
            puts "人類の敗北です"
            ja_game = 2
            return ja_game
        end
    end
end

class AtiHoi
    def ah_rule
        puts "あっち向いてホイ！"
        puts "[0]上\n[1]右\n[2]下\n[3]左"
        human_choice1 = gets.to_i
        cp_choice1 = rand(4)

        atihois = ["上", "右", "下", "左"]
        puts "人類:#{atihois[human_choice1]}, cp:#{atihois[cp_choice1]}"

        @human_choice1 = human_choice1
        @cp_choice1 = cp_choice1
    end

    def ah_now_h
        if @human_choice1 == @cp_choice1
            puts "人間様の勝利です"
            ja_game = 3
            return ja_game
        else
            puts "じゃんけんからやり直してください"
            ja_game = 0
            return ja_game
        end
    end

    def ah_now_c
        if @human_choice1 == @cp_choice1
            puts "人類の敗北です、機械に二連敗とか恥ずかしくないですかw"
            ja_game = 3
            return ja_game
        else
            puts "じゃんけんからやり直してください"
            ja_game = 0
            return ja_game
        end
    end

end

puts "じゃんけんの後、あっち向いてホイをお願いします。まさか人間様が機械相手に負けるはずないですよね"

janken = Janken.new
atihoi = AtiHoi.new
ja_game = 0

loop {
while ja_game == 0
    ja_game = janken.ja_rule
    ja_game = janken.ja_now
end



while ja_game == 1
    ja_game = atihoi.ah_rule
    ja_game = atihoi.ah_now_h
end

while ja_game == 2
    ja_game = atihoi.ah_rule
    ja_game = atihoi.ah_now_c
end

if ja_game == 3
    break
end
}

#私は機械に勝てませんでした、ずっと馬鹿にされ続けました
