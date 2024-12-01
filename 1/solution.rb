#!/usr/bin/env ruby

require 'pry'

class Solution
  def initialize(input_file)
    @input_file = IO.readlines(input_file, chomp: true)
  end

  def split_input
    left, right = [], []
    @input_file.map do |x|
      line = x.split
      left << line.first.to_i
      right << line.last.to_i
    end

    [left, right]
  end

  def part1
    left, right = split_input
    left.sort!
    right.sort!
    total_distance = 0
    left.each_with_index do |e, i|
      total_distance += (e - right[i]).abs
    end

    total_distance
  end

  # Forgot about Array#zip, so lets try that.
  def part1_optimize
    left, right = split_input
    distances = left.sort.zip(right.sort).
      map { |i, j| (i - j).abs }
    distances.sum
  end

  def part2
    left, right = split_input
    similar = left.map { |x| x * right.count(x) }
    similar.sum
  end

  def part2_optimize
    left, right = split_input
    similar_hash = Hash.new(0)
    right.each {|x| similar_hash[x] += 1 }
    similar = left.map {|x| x * similar_hash[x] }
    similar.sum
  end
end

if $PROGRAM_NAME == __FILE__
  input_file = ARGV[0]
  raise "Must pass input file!" unless input_file && File.exist?(input_file)

  runner = Solution.new(input_file)
  puts "Part 1: #{runner.part1}"
  puts "Part 2: #{runner.part2}"
end
