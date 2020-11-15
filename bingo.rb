ALPHABETS = [*?a..?z,*?0..?9]
WORD_LENGTH = 4

### ビンゴカードの生成 ###

# TODO: lenの設定次第では全パターン網羅してもnumに届かない場合がありうるので対策が必要
#       例: 何度か回してもダメっぽかったらlenを自動伸長するなど
def make_words(nums, len)
  result = []
  while result.size < len
    result += Array.new(nums){ Array.new(len){ALPHABETS.sample}.join }
    result.uniq!
  end
  result.take(nums)
end

def display(card)
  puts card.map{|line| line.join(" ")}
end


S = gets.to_i
# TODO: 必要ならばSが正常な入力かを確認
word_list = make_words(S*S, WORD_LENGTH)
bingo_card = word_list.each_slice(S).to_a
display(bingo_card)

### 当選ワードの選定と表示 ###

N = gets.to_i
# TODO: 必要ならばNが正常な入力かを確認
hit_words = word_list.sample(N)
puts hit_words

hit_list = Array.new(S*S)
hit_words.each do |hit|
  if ix = word_list.find_index(hit)
    word_list[ix].prepend("☆")
    hit_list[ix] = true
  end
end

hit_card = hit_list.each_slice(S).to_a
# pp hit_card # DEBUG: デバッグ用なので不要なら消す



### ビンゴ判定 ###
# 斜め判定
naname1 = Array.new(S){|i| hit_card[i][i] }.all?
naname2 = Array.new(S){|i| hit_card[i][-i-1] }.all?
# 横判定
yoko = hit_card.any?(&:all?)
# 縦判定
tate = hit_card.transpose.any?(&:all?)
# 結果出力
def validate_uniq(word_list)
  if (word_list.flatten.size - word_list.flatten.uniq.size) == 0
    return true
  else
    puts "no"
    return false
  end
end
def validate_s
  if (3 <= S )|| (S <= 1000)
    return true
  else
    puts "no"
    return false
  end
end
def validate_n
  if (1 <= N ) || (N <= 2000)
    return true
  else
    puts "no"
    return false
  end
end
def validate_word_list(word_list)
  if (1 <= word_list[1].chars.size) && (word_list[1].chars.size <= 100)

    return true
  else
    puts "no"
    return false
  end
end
def validate_hit_word(hit_words)
  if (hit_words.size - hit_words.uniq.size) == 0
   return true
  else
    puts "no"
    return false
  end
end
if yoko || tate || naname1 || naname2
    if validate_uniq(word_list) && validate_s && validate_n && validate_word_list(word_list) && validate_hit_word(hit_words)
      puts "yes"
    else
      puts "no"
    end
else
  puts "no"
end

## 当選部分に印を付けたビンゴカードを再生成し表示 ##
bingo_card = word_list.each_slice(S).to_a
display(bingo_card)
