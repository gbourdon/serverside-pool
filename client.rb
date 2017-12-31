require 'socket'        # Sockets are in standard library

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)

s.puts "Hi!"
s.close                 # Close the socket when done