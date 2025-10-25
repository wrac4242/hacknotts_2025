import socket

from threading import Thread, Event
import time
import random
# from waiting import wait

HOST = "127.0.0.1"  # Standard loopback interface address (localhost)
PORT = 12345  # Port to listen on (non-privileged ports are > 1023)
CURRENT_PW = "wren-charlie".encode("utf-8")
NEXT_PW = "wren-charlie-next".encode("utf-8")


event = Event()

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
				#wait(lambda: condition == True, timeout_seconds=120, waiting_for="Timeout")
				event.wait()
				client_socket.send(b"Buh bai")
	finally:
		client_socket.shutdown(socket.SHUT_RDWR)
		client_socket.close()
		print("Closing socket")

def the_watcher():
    
    time.sleep(10)
    event.set()
    print("timeout")
    return 

def main():

	s = socket.socket()
 
	s.bind((HOST, PORT))  # bind the socket to the port and ip address

	s.listen(5)  # wait for new connections
	threads = []
	watcher = Thread(target=the_watcher)
	watcher.start()
	threads.append(watcher)
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
