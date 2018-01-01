require 'socket'
require_relative 'gettnclassy.rb'

test = Client.new

test.send_message ARGV.join " "