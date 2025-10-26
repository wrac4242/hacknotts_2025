import secrets

tokens = []

for i in range(10):
    s = secrets.token_hex(nbytes=32)
    tokens.append(s)

with open("dictionary","w+") as f:
    t = "\n".join(tokens)
    f.write(t)