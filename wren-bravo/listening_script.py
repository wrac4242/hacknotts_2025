import socket

from threading import Thread
import time
import random

HOST = "127.0.0.1"  # Standard loopback interface address (localhost)
PORT = 54321  # Port to listen on (non-privileged ports are > 1023)
CURRENT_PW = "KQLcUucMEGu4IpEejaSmD4aHqjpcuDgB".encode("utf-8")
NEXT_PW = "EmWxWdDwjWeaiUZaEfBmTSuu0VGnvQT0".encode("utf-8")

moves = ["rock", "paper", "scissors"]

def on_new_client(client_socket, addr):
	try:
		# Check password
		client_socket.send(b"Current Password: ")
		data = client_socket.recv(1024)#.decode('utf-8')
		if data:
			print(f"{addr} >> {data}")
			if not (data.startswith(CURRENT_PW) and len(data) <= len(CURRENT_PW) + 1):
				client_socket.send(b"Wrong Password! Bye bye!\n") # echo
			else:
				tries = 0
				time_total = 0
				while tries < 30:
					tries += 1
					start_time = time.time()
					move = random.choice(moves)
					client_socket.send(move.encode("utf-8") + b": ")
					data = client_socket.recv(1024)#.decode('utf-8')
					if not data:
						break
					end_time = time.time()
					time_delta = end_time - start_time # seconds as a float
					received = data.decode("utf-8").strip()
					print(f"{addr} >> {data} >> {time_delta:0.2f}")
					if received not in moves:
						client_socket.send(b"Bad move sent\n")
						break
					if not ((move == "rock" and received == "paper") or (move == "paper" and received == "scissors") or (move == "scissors" and received == "rock")):
						# wrong
						client_socket.send(b"Wrong Move\n")
						break

					time_total += time_delta
					if time_total/tries <= 0.75 and tries > 10:
						client_socket.send(b"Password: " + NEXT_PW + b"\n")
						break

					
				else: # on the while
					client_socket.send(b"Too many failed attempts! Bye bye!\n")
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
