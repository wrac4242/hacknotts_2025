import sqlite3
import sys

NEXT_USER = "wren-alpha"

# preamble
con = sqlite3.connect("people.db")
cur = con.cursor()

users_name = input("Only admins can access the next password\nUsername: ").strip()

if "root" in users_name:
    print("Not that easy")
    sys.exit(0)

admin = cur.execute(f"SELECT admin FROM people WHERE name = '{users_name}';").fetchone()

if admin == None:
    print("Please enter a valid user!")
    sys.exit(0)

print(admin)

if admin:
	with open(f'/hacknotts/secrets/{NEXT_USER}_password', 'r') as f:
		print("Congrats! The next password is: "+f.read())
else:
	print("Sorry, you are not an admin")


