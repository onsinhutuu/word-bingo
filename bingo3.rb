ALPHABETS = [*?a..?z,*?0..?9]
WORD_LENGTH = 4

# TODO: lenの設定次第では全パターン網羅してもnumに届かない場合がありうるので対策が必要
#       例: 何度か回してもダメっぽかったらlenを自動伸長するなど
def make_words(nums, len)
  result = []
  while result.size < len
    result += Array.new(nums){ Array.new(len){ALPHABETS.sample}.join }
    result = result.uniq
  end
  result.take(nums)
end

def display(card)
  puts card.map{|line| line.join(" ")}
end

S = gets.to_i
word_list = make_words(S*S, WORD_LENGTH)
bingo_card = word_list.each_slice(S).to_a
display(bingo_card)

##############

N = gets.to_i

hit_words = word_list.sample(N)
puts hit_words

hit_list = Array.new(S*S)
hit_words.each do |hit|
  ix = word_list.find_index(hit)
  if ix
    word_list[ix].prepend("☆") # TODO: 印とやらをつける
    hit_list[ix] = true
  end
end
display(word_list.each_slice(S).to_a)

hit_card = hit_list.each_slice(S).to_a
pp hit_card # TODO: デバッグ用なので不要なら消す
# TODO: 横判定
# TODO: 縦判定
# TODO: 斜め判定
# TODO: 結果出力
  # TODO: word_listから再度ビンゴカードを生成し表示
  # TODO: yes/no の出力
