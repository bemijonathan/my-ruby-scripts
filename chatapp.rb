require 'socket'
server = TCPServer.new 5678

server.accept
