import hashlib


target = "dc00fa84dc542e5ac62e4514eb3b87bc025ccd24"


with open("dictionary","r") as f:
    for word in f.readlines():
        word = word.strip("\n")

        hash =hashlib.sha1((word).encode()).hexdigest()
        print(word)
        print(hash)

        if hash == target:
            print(word)

            break


        