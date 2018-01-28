require 'socket'
require_relative 'link/sender.rb'

$PORT = 2000

class Array
    def server_parse
        output = self.map do |test|
            test = test.split "|"
            test.shift
            test.join "|"
        end
        output
    end
end

class String
    def server_parse
        test = self.split "|"
        test.shift
        test.join "|"
    end
end

class Client
    attr_reader :hostname
    attr_reader :port
    attr_accessor :cache

    def initialize(hostname = 'localhost', port = $PORT)
        @hostname = hostname
        @port = port
        @cache = []
        @count = 0
    end

    def send_message(message)
        client = Sender::Client.new(@hostname, @port)
        client.sendMessage("CHATMSG",{"Sender" => Socket.gethostname, "Message" => 'true'}, message)
    end

    def get_messages
        output = []
        client = Sender::Client.new(@hostname, @port)
        client.sendMessage("QUERY",{"Sender" => Socket.gethostname, "Size" => 100, "IncludeID" => "false"})
        while line = client.socket.gets
           output.push line.chomp
        end
        output
    end

    def get_messages_raw
        output = []
        client = Sender::Client.new(@hostname, @port)
        client.sendMessage("QUERY",{"Sender" => Socket.gethostname, "Size" => 100,"IncludeID" => "true"})
        while line = client.socket.gets
           output.push line.chop
        end
        output
    end
end