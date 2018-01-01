require 'socket'
require_relative 'gettnclassy.rb'

test = Client.new

test.send_message ARGV.join " " unless ARGV.empty?
puts test.get_messages