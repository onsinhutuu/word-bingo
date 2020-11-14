#文字の検索
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

def bingo_row(hantei,i0,j0)
  (0..S-1).each do |j|
  #1つでも0ならNO
    if hantei[i0][j] == 0
      return false
    end
  end
#全て1の場合、YES
  (0..S-1).each do |j|
  #全てに☆を付ける
  hantei[i0][j] = "☆" + hantei[i0][j]
  end
  return true
end
#横のビンゴ判定


def bingo_col(hantei,i0,j0)
  (0..S-1).each do |i|
  #1つでも0ならNO
    if hantei[i][j0] == 0
      return false
    end
  end
  #全て1の場合、YES
  (0..S-1).each do |j|
  #全てに☆を付ける
  hantei[i0][j] = "☆" + hantei[i0][j]
  end
  return true
end

def bingo_down(hantei,i0,j0)
  if i0 != j0
    return false
  end
  (0..S-1).each do |i|
    j = i
    #1つでも0ならNO
    if hantei[i][j] == 0
      return false
    end
  end
#全て1の場合、YES
 (0..S-1).each do |j|
  #全てに☆を付ける
  hantei[i0][j] = "☆" + hantei[i0][j]
  end
return true
end


def bingo_up(hantei,i0,j0)
(0..S-1).each do |i|
j = S-1-i
#1つでも0ならNO
if hantei[i][j] == 0
return false
end
end
#全て1の場合、YES
 (0..S-1).each do |j|
  #全てに☆を付ける
  hantei[i0][j] = "☆" + hantei[i0][j]
  end
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
puts word_n


hantei = Array.new(S)
(0..S-1).each do |i|
  ar = Array.new(S,0)
  hantei[i] = ar
end
ctr = 0
word_n.each do |val|
  i,j = find_position(word_arr,val)
  if i == nil
    printf("バグのため終了\n")
    exit 10
  end
  hantei[i][j] = val
  # 以下４つのビンゴ判定（４つのメソッドをつくったほうがよいかと思います）
  ret = bingo_row(hantei,i,j)
    if ret == true
      printf("YeS1\n")
      ctr += 1
      break
    end
  ret = bingo_col(hantei,i,j)
    if ret == true
      printf("YeS2\n")
      ctr += 1
      break
    end
  ret = bingo_down(hantei,i,j)
    if ret == true
      printf("YeS3\n")
      ctr += 1
      break
    end
  ret = bingo_up(hantei,i,j)
    if ret == true
      printf("YeS4\n")
      ctr += 1
      break
    end
end
if ctr == 0
  printf("NO\n")
end
pp hantei