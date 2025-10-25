import sqlite3
import sys

NEXT_USER = "wren-alpha"

# preamble
con = sqlite3.connect("people.db")
cur = con.cursor()

users_name = input("What is your name: ").strip()

if "root" in users_name:
    print("Not that easy")
    sys.exit(0)

admin = cur.execute(f"SELECT admin FROM people WHERE name = '{users_name}';").fetchone()

if admin == None:
    print("Please enter a valid user!")
    sys.exit(0)

print(admin)

if admin:
	print("admin")
else:
	print("not admin")

# get password
#with open(f'/hacknotts/secrets/{NEXT_USER}_password', 'r') as f:
#	print(f.read())

