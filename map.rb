require "parallel"

result = Parallel.map(1..10) do |item|
  # 普通のmapのようだがブロックは並列に実行される
  p item ** 2
end

p result
