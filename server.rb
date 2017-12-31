require 'socket'                 # Get sockets from stdlib

logs = []
server = TCPServer.open(2000)    # Socket to listen on port 2000
loop {                           # Servers run forever
   Thread.start(server.accept) do |client|
        logs.each {|log| client.puts log}
        while line = client.gets     # Read lines from the socket
            puts line.chop       # And print with platform line terminator
            client.puts line.chomp
            logs.push line.chomp
        end
        client.close                  # Disconnect from the client
    end
}