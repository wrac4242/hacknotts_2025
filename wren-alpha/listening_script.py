import socket

from threading import Thread

HOST = "127.0.0.1"  # Standard loopback interface address (localhost)
PORT = 65432  # Port to listen on (non-privileged ports are > 1023)
CURRENT_PW = "wren-alpha".encode("utf-8")
NEXT_PW = "wren-alpha-next"

def on_new_client(client_socket, addr):
	retry_count = 8
	try:
		while True:
			client_socket.send(b"Current Password: ")
			data = client_socket.recv(1024)#.decode('utf-8')
			if not data:
				break
			print(f"{addr} >> {data}")
			if data.startswith(CURRENT_PW) and len(data) <= len(CURRENT_PW) + 1:
				client_socket.send(b"Correct, the next password is: " + NEXT_PW + b"\n")
				break
			else:
				client_socket.send(b"Wrong Password\n") # echo
				retry_count -= 1
				if retry_count == 0:
					client_socket.send(b"Too many failed attempts! Bye bye!\n")
					break
	finally:
		client_socket.shutdown(socket.SHUT_RDWR)
		client_socket.close()
		print("Closing socket")


def main():

	s = socket.socket()
 
	s.bind((HOST, PORT))  # bind the socket to the port and ip address

	s.listen(5)  # wait for new connections
	threads = []
	try:
		while True:
			c, addr = s.accept()  # Establish connection with client.
			# this returns a new socket object and the IP address of the client
			print(f"New connection from: {addr}")
			thread = Thread(target=on_new_client, args=(c, addr))  # create the thread
			thread.start()  # start the thread
			threads.append(thread)
	finally:
		s.shutdown(socket.SHUT_RDWR)
		s.close()


if __name__ == '__main__':
	main()
