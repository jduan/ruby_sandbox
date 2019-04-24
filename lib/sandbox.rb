require "sandbox/version"

module Sandbox
  def self.hello
    puts "hello world!"
  end

  private_class_method :hello
end

puts "hi"
Sandbox.hello
