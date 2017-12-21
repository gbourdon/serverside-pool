require 'socket'

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)

while line = s.gets     # Read lines from the socket
   time = Time.at(line.chomp.to_i)       # And print with platform line terminator
end
latentcy = Time.now - time
p latentcy
s.close                 # Close the socket when done