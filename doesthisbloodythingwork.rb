require 'socket'                 # Get sockets from stdlib

server = TCPServer.open(2000)    # Socket to listen on port 2000

logs = []

loop do
   Thread.start(server.accept) do |client|
        message = client.gets.chomp
        client.puts "Hi."
        client.puts "Can you hear me?"
        client.puts "Good."
        client.close
   end
end