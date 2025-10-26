import hashlib


target = "5029314dea388cbeaf602f4245fa78e47d930322"


with open("dictionary","r") as f:
    for word in f.readlines():
        word = word.strip("\n")

        hash =hashlib.sha1((word).encode()).hexdigest()


        if hash == target:
            print(word)

            break


        