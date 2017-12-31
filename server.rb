require 'socket'                 # Get sockets from stdlib

server = TCPServer.open(2000)    # Socket to listen on port 2000
loop {                           # Servers run forever
   client = server.accept        # Wait for a client to connect
   puts client.gets
   client.puts "End"
   client.close                  # Disconnect from the client
}