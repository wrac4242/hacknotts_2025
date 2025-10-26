import hashlib


target = "82f2923433d3a47d10af450058e8642c5a4c022d"


with open("dictionary","r") as f:
    for word in f.readlines():
        word = word.strip("\n")

        hash =hashlib.sha1((word).encode()).hexdigest()


        if hash == target:
            print(word)

            break


        