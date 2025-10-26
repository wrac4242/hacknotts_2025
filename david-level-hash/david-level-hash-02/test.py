import hashlib


target = "3292ef7a971cebd80337de6995421c735e16f207"
salt = "flowers"

with open("dictionary","r") as f:
    for word in f.readlines():
        word = word.strip("\n")

        hash =hashlib.sha1((word+salt).encode(),usedforsecurity=False).hexdigest()
        print(hash)
        print(word+salt)

        if hash == target:
            print(word+salt)

            break


        