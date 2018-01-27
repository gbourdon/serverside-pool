require_relative 'core.rb'
require_relative 'link/reciever.rb'
PORT = 2000

def initilize
    puts "Zeus TelChat Server [Version Dev]"
    puts
    puts "Server Initilized".upcase
    puts "IP ADDRESS: #{IPSocket.getaddress(Socket.gethostname)}"
    puts "PORT: #{PORT}"
    puts 
end

initilize

server = TCPServer.open(PORT)
logs = []

loop do
    Thread.start(server.accept) do |client|  
        message = client.getMessage

        case message.type
            when "CHATMSG"
                unless message.message == ""
                    puts "#{message.augments['Sender']}:#{message.message}"
                    logs.push "#{message.augments['Sender']}:#{message.message}"
                end
        end

        client.close                  # Disconnect from the client
    end
end