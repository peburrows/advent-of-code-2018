input = File.read(File.join(File.dirname(__FILE__), "../inputs/day5.txt"))
input = input.split('')

def react(letters)
  letters.reduce([]){|acc, l|
    if acc.empty?
      acc << l
    elsif compare_letters(l, acc.last)
      acc.pop
    else
      acc << l
    end
    acc
  }
end

def compare_letters(a, b) 
  return a && b && a != b && a.swapcase == b
end

def remove_all(letters, remove)
  remove = remove.downcase
  letters.delete_if{|x| x.downcase == remove}
end

def problem1(input)
  puts "problem 1: #{react(input.dup).length}"
end

def problem2(input)
  best = 1.0/0
  best_letter = nil
  # reduced = react(input.dup)
  ('a'..'z').each do |l|
    len = react(remove_all(input.dup, l)).length
    if len < best
      best = len
      best_letter = l
    end
  end
  puts "problem 2: #{best}"
end

problem1(input)
problem2(input)
