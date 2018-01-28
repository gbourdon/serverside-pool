require_relative 'core.rb'

test = Client.new
cache = []

#puts test.get_messages_raw
loop do
    output = test.get_messages_raw
    
    output.each do |message|
        unless cache.include? message
            puts message.server_parse# unless message.server_parse == ""
            cache.push message
        end
    end
end
