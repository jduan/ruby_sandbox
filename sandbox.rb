def f2c(fahrenheit)
  (fahrenheit - 32) * 5.0 / 9
end

puts f2c(86)
puts f2c(68)

def sum(a, *others, b)
  total = a + b
  others.each {|other| total += other}
  total
end

puts "sum is #{sum(1, 2, 3, 4)}"

class C
  attr_reader :name
  def name=(name)
    @name = name
  end

  def hi
    self.name = "hi"
  end
end

c = C.new
c.name = "hello"
c.hi
  puts c.name
