require 'parallel'

result = Parallel.map(1..10) do |item|
  p [item ** 2, Parallel.worker_number]
end

p result
