
S = gets.to_i
arr = Array.new(S)
test_no = 0
(0..S-1).each do |i|
  ar = Array.new(S)
  (0..S-1).each do |j|
    test_no += 1
    ar[j] = "test" + test_no.to_s
  end
  arr[i] = ar
end


#個別に表示
(0..S-1).each do |i|
  (0..S-1).each do |j|
    printf("%s ",arr[i][j])
  end
  printf("\n")
end
N = gets.to_i
 	arr2 = Array.new(N)
	test_no = 0
	(0..N-1).each do |i|
    test_no += 1
    arr2[i] = "test" + test_no.to_s
	 end
 puts arr2.shuffle

value_seed = [*'a'..'z', *'0'..'9']
sample = value_seed.sample
puts sample
