def display(card)
  puts card.map{|line| line.join(" ")}
end
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
def validate_word(word_list,hit_words)
  if (/\A[a-zA-Z0-9]+\z/.match?(word_list)) && (/\A[a-zA-Z0-9]+\z/.match?(hit_words))
    return true
  else
    puts "no1"
    return false
  end
end
def validate_uniq(word_list)
  if (word_list.size - word_list.uniq.size) == 0
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
	if validate_word(word_list,hit_words) && validate_uniq(word_list) && validate_s && validate_n && validate_word_list(word_list) && validate_hit_word(hit_words)
    puts "yes"
  else
    puts "no"
  end
else
  puts "no"
end
pp word_list
pp word_list.size
pp word_list.uniq.size

bingo_card = word_list.each_slice(S).to_a
display(bingo_card)