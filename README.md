# ServerSide Pool

The goal of this project is to create a basic server-client messageing service.

## Manifest

* `gettnclassy.rb`  
Contains all required classes.

* `server.rb`  
A basic server. Takes input, adds it to the log, and then gives the client all messages in the log

* `client.rb`  
A basic client, returns all input given

* `reciever.rb`  
Gets all input, and continually updates it

* `tests`  
Folder containing various tests of the system
    * `100.rb`  
    Prints the numbers 1-100 to the server
    * `doesthisbloodythingwork.rb`  
    Very basic simulation of a server
    * `test.rb`  
    Sends any input to the server, and displays all input
    * `start.bat`  
    Starts the server, reciever, and runs `100.rb`