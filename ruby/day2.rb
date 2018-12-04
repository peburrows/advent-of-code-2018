input = File.readlines(File.join(File.dirname(__FILE__), "../inputs/day2.txt"))

# problem1
two = 0
three = 0
input.each {|id|
  found2, found3 = false, false
  id.each_char{|c| 
    if !found2 && id.count(c) == 2
      found2 = true
      two = two + 1
    end
    if !found3 && id.count(c) == 3
      found3 = true
      three = three + 1
    end
  }
}
puts two * three


# problem 2
def off_by_one?(a, b)
  diff = 0
  ac, bc = a.chars, b.chars
  ac.length.times{|i| 
    if ac[i] != bc[i]
      diff = diff + 1
    end
    return false if diff > 1
  }
  return true
end

def same_chars(a, b) 
  same = []
  ac, bc = a.chars, b.chars
  ac.length.times {|i|
    if ac[i] == bc[i]
      same << ac[i]
    end
  }
  return same.join
end

found = nil
input.each_with_index {|line, i|
  break if found
  input[(i+1)..-1].each {|inner|
    if off_by_one?(line, inner)
      found = [line, inner]
      break
    end
  }
}

puts same_chars(*found)