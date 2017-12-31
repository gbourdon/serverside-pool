require 'socket'                 # Get sockets from stdlib

server = TCPServer.open(2000)    # Socket to listen on port 2000
loop {                           # Servers run forever
   Thread.start(server.accept) do |client|
    while line = client.gets     # Read lines from the socket
        puts line.chop       # And print with platform line terminator
    end
   client.close                  # Disconnect from the client
   end
}