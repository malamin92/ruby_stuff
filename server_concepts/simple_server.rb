require 'socket'

server = TCPServer.open(2000)
loop{
	client = server.accept
	client.puts(Time.now.ctime)
	clinet.puts "Closing the connection. BYE!"
	client.close
}

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)

while line = s.gets
	puts line.chop
end

s.close