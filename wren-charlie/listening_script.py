import socket

from threading import Thread, Event
import time
import random
from inotify_simple import INotify, flags
import os
import string

HOST = "127.0.0.1"  # Standard loopback interface address (localhost)
PORT = 12345  # Port to listen on (non-privileged ports are > 1023)
CURRENT_PW = "wren-charlie".encode("utf-8")
NEXT_PW = "wren-delta"

PATH_TO_WATCH = "/tmp/listening_to_you"

pending_files = {} # datatype stored: filename -> {event: event, permissions_right: bool}, set perms, then set event

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
				filename = ''.join(random.choices(string.ascii_uppercase + string.digits, k=6))
				event = Event()
				to_add = {"event": event, "permissions_right": False}
				pending_files[filename] = to_add
				client_socket.send(f"Create the file {PATH_TO_WATCH}{filename} so it isnt accessible to another user\n".encode())
				if event.wait(15): # sent
					if pending_files[filename]["permissions_right"]:
						client_socket.send(f"The next password is {NEXT_PW}\n".encode())
					else:
						client_socket.send(f"The file was created with permissions so everyone can read! Try again\n".encode())
				else:
					client_socket.send(b"Too slow!\n")
	finally:
		client_socket.shutdown(socket.SHUT_RDWR)
		client_socket.close()
		print("Closing socket")

def the_watcher():
	# testing program to demonstrate filesystem inotify
	inotify = INotify()
	watch_flags = flags.CREATE | flags.MOVED_TO | flags.MODIFY 
	wd = inotify.add_watch(PATH_TO_WATCH, watch_flags)

	while True:
		for event in inotify.read(timeout=200):
			print(event)
			for flag in flags.from_mask(event.mask):
				print('    ' + str(flag))
			# check if file has specific permission
			status = os.stat(PATH_TO_WATCH + event.name)
			
			print("Readable" if status.st_mode & 0o004 else "not readable" )
			if event.name in pending_files:
				print("in dict")
				pending_files[event.name]["permissions_right"] = not (status.st_mode & 0o004)
				pending_files[event.name]["event"].set()
			else:
				print("not in dict")
			# Clean file
			if os.path.exists(PATH_TO_WATCH+event.name):
				os.remove(PATH_TO_WATCH+event.name)


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
