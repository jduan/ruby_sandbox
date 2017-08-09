class Object
  def in?(other)
    other.include? self
  end
end

puts "Brian".in?(["Brian", "Morearty"]) # => true
puts "Brian".in?(["James", "Bond"])     # => false

puts 3.in?([1, 2, 3])                   # => true
puts 3.in?([4, 5])                      # => false
puts 3.in?(1..5)                        # => true
puts 3.in?(4..6)                        # => false
