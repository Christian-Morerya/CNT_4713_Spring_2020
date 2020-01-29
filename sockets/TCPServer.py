#TCPServer.py

#TCP (SOCK_STREAM) is a connection-based protocol. The connection is e
#parties have a conversation until the connection is terminated by one
from socket import socket, SOCK_STREAM, AF_INET
#Create a TCP socket
#Notice the use of SOCK_STREAM for TCP packets
serverSocket = socket(AF_INET, SOCK_STREAM)
serverPort=12001
# Assign IP address and port number to socket
serverSocket.bind(('', serverPort))
serverSocket.listen(1)
print("Interrupt with CTRL-C")
while True:
    try:
        connectionSocket, addr = serverSocket.accept()
        print ("Connection from %s and %s" % addr)
        # recieve client packet
        message = connectionSocket.recv(2048)
                #print "Original message from client", message
        # Capitalize the message from the client
        message = message.upper()
        connectionSocket.send(message)
        connectionSocket.close()
    except KeyboardInterrupt:
        print ("\nInterrupted by CTRL-C")
        break

serverSocket.close()
