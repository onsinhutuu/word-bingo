def find_position(arr,val)
  (0..S-1).each do |i|
    (0..S-1).each do |j|
      if arr[i][j] == val
        return i,j
      end
    end
  end
  return nil,nil
end
#横のビンゴ判定
def bingo_row(hantei,i0,j0)
  (0..S-1).each do |j|
    #1つでも0ならNO
    if hantei[i0][j][0] != "☆"
      return false
    end
  end
  #全て1の場合、YES
  return true
end


S = gets.to_i
word_arr = Array.new(S)
data = [*'a'..'z', *'0'..'9']
(0..S-1).each do |i|
  ar = Array.new(S){data.sample(4).join}
  word_arr[i] = ar
end

(0..S-1).each do |i|
  (0..S-1).each do |j|
    printf("%s ",word_arr[i][j])
  end
  printf("\n")
end

N = gets.to_i
word_arr_flat = word_arr.flatten
word_n = word_arr_flat.sample(N)

word_n.each do |word|
  printf("%s ",word)
end
printf("\n")

hantei = Array.new(S)
(0..S-1).each do |i|
  ar = word_arr[i].dup
  hantei[i] = ar
end

pp hantei
ctr = 0
word_n.each do |val|
  i,j = find_position(word_arr,val)
  if i == nil
    printf("バグのため終了\n")
    exit 10
  end
  hantei[i][j] = "☆" + hantei[i][j]
  # 以下４つのビンゴ判定（４つのメソッドをつくったほうがよいかと思います）
  ret = bingo_row(hantei,i,j)
  if ret == true
    printf("横 ビンゴ\n")
    ctr += 1
    break
  end
end
if ctr == 0
  printf("ビンゴなし\n")
end
  printf("%s ",hantei)
  printf("\n")
end
