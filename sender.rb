require 'socket'
require_relative "core.rb"

test = Client.new

loop do
    print "> "
    message = gets.chomp
    break if message == "|exit"
    test.send_message message unless message == ""
end