require 'socket'

class Client
    attr_reader :hostname
    attr_reader :port
    attr_accessor :cache

    def initialize(hostname = 'localhost', port = 2000)
        @hostname = hostname
        @port = port
        @cache = []
    end

    def send_message(message)
        s = TCPSocket.open(@hostname, @port)
        s.puts "#{Socket.gethostname}: #{message}"
        s.close
    end

    def get_messages
        output = []
        s = TCPSocket.open(@hostname, @port)
        s.puts nil
        while line = s.gets
           output.push line.chop
        end
        s.close
        output
    end
end

class Server
    attr_reader :port

    def initialize(port = 2000)
        @server = TCPServer.open(port)
        @logs = []
    end

    def run
        loop do
            Thread.start(@server.accept) do |client|
                 message = client.gets.chomp     # Read lines from the socket
                 unless message == ""
                     puts message
                     @logs.push message
                 end
                 client.puts @logs
                 client.close                  # Disconnect from the client
            end
        end
    end
end