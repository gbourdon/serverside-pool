require 'socket'
require_relative 'gettnclassy.rb'

test = Client.new
(1..100).each do |n|
    test.send_message n
end