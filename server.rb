require_relative 'core.rb'
PORT = 2000

def initilize
    puts "Zeus TelChat Server [Version Alpha 0.1.0]"
    puts
    server = Server.new(PORT)
    puts "Server Initilized".upcase
    puts "IP ADDRESS: #{IPSocket.getaddress(Socket.gethostname)}"
    puts "PORT: #{PORT}"
    puts
    server 
end

server = initilize

server.run