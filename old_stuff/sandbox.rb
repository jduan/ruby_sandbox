File.open(ARGV[0]) do |fd|
  twos = 0
  threes = 0

  fd.each_line do |line|
    counts = Hash.new(0)
    line.each_char do |ch|
      counts[ch] += 1
    end
    inverted = counts.invert
    if inverted.has_key?(2)
      twos += 1
    end
    if inverted.has_key?(3)
      threes += 1
    end
    puts "total twos: #{twos}, total threes: #{threes}"
  end

  puts twos * threes
end
