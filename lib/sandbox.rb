require "sandbox/version"

module Sandbox
  def self.hello
    name = "john"
    multi_line_str = <<~MSG
      This is the first line.
      This is the second line.
      #{name}
    MSG
    puts multi_line_str
  end

  # private_class_method :hello
end

puts "hi"
Sandbox.hello
