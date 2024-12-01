require_relative "./solution"
require "benchmark"

Benchmark.bm do |x|
  x.report("part1") { 1000.times do; Solution.new("./input.txt").part1; end }
  x.report("part1 opt") { 1000.times do; Solution.new("./input.txt").part1_optimize; end }
  x.report("part2") { 1000.times do; Solution.new("./input.txt").part2; end }
  x.report("part2 opt") { 1000.times do; Solution.new("./input.txt").part2_optimize; end }
end
