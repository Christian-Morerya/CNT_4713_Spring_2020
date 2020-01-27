


serverSocket.listen(1)
print "Interrupt wit CTRL=C"

while(True):
    try:
        connctionSocket, addr = serverSocket.accept()
        print "Connectin from %s prot %s"