require_relative 'core.rb'
require_relative 'link/reciever.rb'
PORT = 2000

def initilize(port = PORT)
    puts "Zeus TelChat Server [Version Dev]"
    puts
    server = TCPServer.open(port)
    puts "Server Initilized".upcase
    puts "IP ADDRESS: #{IPSocket.getaddress(Socket.gethostname)}"
    puts "PORT: #{PORT}"
    puts 
    server
end

count = 1
server = initilize(PORT)
logs = []

loop do
    Thread.start(server.accept) do |client|  
        message = client.getMessage

        case message.type
            when "CHATMSG"
                unless message.message == ""
                    puts "#{count}|#{message.augments['Sender']}: #{message.message}"
                    logs.push "#{count}|#{message.augments['Sender']}: #{message.message}"
                    count += 1
                end
            when "QUERY"
                if message.augments["IncludeID"] == "true"
                    client.puts logs.last(message.augments['Size'].to_i)
                else
                    client.puts logs.last(message.augments['Size'].to_i).server_parse
                end
        end

        client.close                  # Disconnect from the client
    end
end