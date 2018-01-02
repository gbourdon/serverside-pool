require 'socket'                 # Get sockets from stdlib

server = TCPServer.open(2000)    # Socket to listen on port 2000

loop do
   Thread.start(server.accept) do |client|
        message = client.gets.chomp
        client.puts message
        client.puts "Ending Connection."
        client.puts "Bye!"
        client.close
   end
end