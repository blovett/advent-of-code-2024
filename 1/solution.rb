#!/usr/bin/env ruby

input_file = ARGV[0]
raise "Must pass input file!" unless input_file && File.exist?(input_file)

lists = File.read(input_file).split("\n").map(&:split)
length = lists.size
left = lists[..length].map{|x| x[0].to_i}.sort
right = lists[..length].map{|x| x[1].to_i}.sort

total_distance = 0
simul_score = 0
right_count = Hash.new{|h,k| h[k] = 0 }

length.times do |i|
  right_count[right[i]] += 1
  distance = (left[i] - right[i]).abs
  total_distance += distance
end

length.times do |i|
  simul_score += left[i] * right_count[left[i]]
end

puts "Total distance #{total_distance}"
puts "Similarity score #{simul_score}"
