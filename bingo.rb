S = gets.to_i
# ビンゴカードの入力
bingo_card = Array.new(S){ gets.split}
word_list  = bingo_card.flatten

### 当選ワードの入力 ###

N = gets.to_i
hit_words = Array.new(N){ gets.chomp }

hit_list = Array.new(S*S)
hit_words.each do |hit|
  if ix = word_list.find_index(hit)
    hit_list[ix] = true
  end
end

hit_card = hit_list.each_slice(S).to_a

### ビンゴ判定 ###
# 斜め判定
naname1 = Array.new(S){|i| hit_card[i][i] }.all?
naname2 = Array.new(S){|i| hit_card[i][-i-1] }.all?
# 横判定
yoko = hit_card.any?(&:all?)

# 縦判定
tate = hit_card.transpose.any?(&:all?)

### 勝利条件判定 ###
# 半角英数字か判定
def validate_words(word_list,hit_words)
	array = [*word_list, *hit_words]
  if array.grep(/^[a-z0-9]+$/) == array
    return true
  else
    puts "no1"
    return false
  end
end
# word_listが重複してないか判定
def validate_uniq(word_list)
  if (word_list.size - word_list.uniq.size) == 0
    return true
  else
    puts "no2"
    return false
  end
end
# Sが3以上100以下か判定
def validate_s
  if (3 <= S ) && (S <= 1000)
    return true
  else
    puts "no3"
    return false
  end
end
# Nが1以上2000以下か判定
def validate_n
  if (1 <= N ) && (N <= 2000)
    return true
  else
    puts "no4"
    return false
  end
end
# word_listが重複してないか判定
def validate_word_list(word_list)
  if (1 <= word_list[1].chars.size) && (word_list[1].chars.size <= 100)
    return true
  else
    puts "no5"
    return false
  end
end
# hit_wordsが重複してないか判定
def validate_hit_word(hit_words)
  if (hit_words.size - hit_words.uniq.size) == 0
   return true
  else
    puts "no6"
    return false
  end
end
# 判定出力
if yoko || tate || naname1 || naname2
	if validate_words(word_list,hit_words) && validate_uniq(word_list) && validate_s && validate_n && validate_word_list(word_list) && validate_hit_word(hit_words)
    puts "yes"
  else
    puts "no7"
  end
else
  puts "no"
end
