import socket

soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
soc.connect(('localhost', 54321))
soc.recv(512) # asking for cur password
soc.send('wren-bravo'.encode())

while True:
	data = soc.recv(512)
	print(data.decode())
	match (data):
		case b"paper: ":
			soc.send(b'scissors')
		case b"rock: ":
			soc.send(b'paper')
		case b"scissors: ":
			soc.send(b'rock')
		case _:
			break

soc.close()
