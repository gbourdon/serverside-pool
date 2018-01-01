require 'socket'
require_relative 'gettnclassy.rb'

test = Client.new

cache = test.get_messages
puts cache

loop do
    output = test.get_messages
    cache.length.times {output.shift}
    puts output
    cache = test.get_messages
end
