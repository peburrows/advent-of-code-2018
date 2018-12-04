require 'date'
input = File.readlines(File.join(File.dirname(__FILE__), "../inputs/day4.txt"))

# problem 1
guards = {}

sorted = input.map { |line|
  {
    time: DateTime.parse(line[1..16]),
    data: line[19..-1]
  }
}.sort_by{|l| l[:time]}

g = nil
s = nil
sorted.each do |record|
  if record[:data][0..4] == "Guard" 
    g = record[:data].match(/\d+/).to_s
    guards[g] ||= []
    next
  end


  if record[:data].match(/falls/) 
    s = record[:time]
  elsif record[:data].match(/wakes/)
    guards[g] = guards[g] + (s.min...record[:time].min).to_a
  end
end

gid = nil
worst = []
guards.each {|g, sleeps|
  if sleeps.length > worst.length
    gid = g
    worst = sleeps
  end
}

puts gid
min_count = 0
min = nil
worst.group_by{|m| m }.each{|k,v|
  if v.length > min_count
    min_count = v.length
    min = k
  end
}

puts min.to_i * gid.to_i

most=0
most_min=nil
most_g=nil
guards.each {|g, sleeps|
  sleeps.group_by{|s| s}.each do |m, group|
    if group.length > most
      most_min = m
      most_g = g
      most = group.length
    end
  end
}

puts most_g.to_i * most_min

# puts guardsdd

