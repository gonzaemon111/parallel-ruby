result = Parallel.each(1..10) do |item|
  # 普通のeachのようだがブロックは並列に実行される
  p item ** 2
end

p result
