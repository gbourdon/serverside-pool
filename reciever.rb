require 'socket'
require_relative 'gettnclassy.rb'

test = Client.new
cache = []

loop do
    output = test.get_messages

    output.each do |message|
        unless cache.include? message
            puts message
            cache.push message
        end
    end
end
