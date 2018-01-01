require 'socket'                 # Get sockets from stdlib

server = TCPServer.open(2000)    # Socket to listen on port 2000

logs = []

loop do
   Thread.start(server.accept) do |client|
        message = client.gets.chomp     # Read lines from the socket
        puts message
        logs.push message
        client.puts logs
        client.close                  # Disconnect from the client
   end
end