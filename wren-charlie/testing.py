from inotify_simple import INotify, flags
import os

# testing program to demonstrate filesystem inotify

path_to_watch = "./temp/"

inotify = INotify()
watch_flags = flags.CREATE | flags.MOVED_TO | flags.MODIFY 
wd = inotify.add_watch(path_to_watch, watch_flags)

while True:
	for event in inotify.read(timeout=200):
		print(event)
		for flag in flags.from_mask(event.mask):
			print('    ' + str(flag))
		# check if file has specific permission
		status = os.stat(path_to_watch + event.name)
		print(status)
		print("Readable" if status.st_mode & 0o004 else "not readable" )
