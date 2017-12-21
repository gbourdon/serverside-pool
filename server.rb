require 'socket'                 # Get sockets from stdlib

server = TCPServer.open(2000)    # Socket to listen on port 2000
loop {                           # Servers run forever
    Thread.start(server.accept) do |client|
        client.puts(Time.now.to_i)   # Send the time to the client
        #client.puts "Closing the connection. Bye!"
        puts "Client Connected"
        client.close                  # Disconnect from the client
    end
}