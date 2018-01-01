require 'socket'

class Client
    attr_reader :hostname
    attr_accessor :port

    def initialize(hostname = 'localhost', port = 2000)
        @hostname = hostname
        @port = port
    end

    def send_message(message)
        s = TCPSocket.open(@hostname, @port)
        s.puts "#{Socket.gethostname}: #{message}"
        s.close
    end
end