input = File.readlines(File.join(File.dirname(__FILE__), "../inputs/day1.txt"))

# problem 1
puts input.map(&:to_i).reduce(0, &:+)

# problem 2
sum = 0
found = nil
seen = {} 

while !found do
  input.each{|i| 
    sum = sum + i.to_i
    if seen[sum]
      found = sum
      break
    else
      seen[sum] = true
    end
  }
end

puts found