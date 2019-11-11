class Player #プレイヤーのじゃんけんクラス

  def hand # じゃんけんで出す手のメソッド

# じゃんけんの手を出させるために表示する文字
    puts "数字を入力してください。" #じゃんけんの手を選ばせる
    puts "0: グー"                #0でグーを出したことになる
    puts "1: パー"                #1でパーを出したことになる
    puts "2: チョキ"              #2でチョキを出したことになる

    gets # getsで入力された数値を文字列として取得
  end
end

class Enemy #コンピュータのじゃんけんクラス
  def hand #コンピュータがじゃんけんで出す手のメソッド
    rand(0..2) #0~2の数値をランダムで選択
  end
end

class Janken #プレイヤーの入力した数値、ランダムで選ばれたコンピュータの数値でじゃんけんさせる
  def pon(janken, player, enemy) #プレイヤーとコンピュータが手を出し、じゃんけんの結果を表示させるメソッド
    if ! ["0\n", "1\n", "2\n"].include?(player) #
      puts "0〜2の数字を入力してください。"
      self.pon(janken, Player.new.hand, Enemy.new.hand)
    elsif (player.to_i - enemy.to_i + 3) % 3 == 2 #プレイヤーの手からコンピュータの手を引き、3足して3で割る。余りが2であればプレイヤーの勝利と表示される。(この際、.to_iで文字列を数値化している)
      puts "相手の手は#{Choice[enemy]}です。あなたの勝ちです。"
    elsif (player.to_i - enemy.to_i + 3) % 3 == 1 #プレイヤーの手からコンピュータの手を引き、3足して3で割る。余りが1であればプレイヤーの敗北と表示される。(この際、.to_iで文字列を数値化している)
      puts "相手の手は#{Choice[enemy]}です。あなたの負けです。"
    else
      puts "相手の手は#{Choice[enemy]}です。あいこです。"
      self.pon(janken, Player.new.hand, Enemy.new.hand)
    end
  end
end

Choice = {0 => "グー", 1 => "パー", 2 => "チョキ"} #

player = Player.new
enemy = Enemy.new
janken = Janken.new

# janken.ponにjankenインスタンスを引数で渡すのではなく、ponメソッドの中でJanken.newをする形でも良い
janken.pon(janken, player.hand, enemy.hand)