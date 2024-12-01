#!/usr/bin/env ruby

input_file = ARGV[0]
raise "Must pass input file!" unless input_file && File.exist?(input_file)

lists = File.read(input_file)
left, right = []
lists = lists.split("\n").map(&:split)
length = lists.size
left = lists[..length].map{|x| x[0].to_i}.sort
right = lists[..length].map{|x| x[1].to_i}.sort
total_distance = 0

length.times do |i|
  distance = (left[i] - right[i]).abs
  total_distance += distance
end

puts "Total distance #{total_distance}"
