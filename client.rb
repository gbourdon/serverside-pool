require 'socket'        # Sockets are in standard library

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)

s.puts nil # Gets past the roadblock of the server expecting an input at the same time as us
while line = s.gets     # Read lines from the socket
   puts line.chop       # And print with platform line terminator
end
s.close                 # Close the socket when done