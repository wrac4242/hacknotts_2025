import hashlib


target = "86ae3e63274b5124e96dd6cbfc9b5d077baa83ba"
salt = "flowers"

with open("dictionary","r") as f:
    for word in f.readlines():
        word = word.strip("\n")

        hash =hashlib.sha1((word).encode()).hexdigest()
        print(word)
        print(hash)

        if hash == target:
            print(word)

            break


        