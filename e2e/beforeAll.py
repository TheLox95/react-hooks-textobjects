import os

prefix = "./e2e/"
folders = os.listdir(prefix)

for f in folders:
    if os.path.isdir(prefix + f) == False:
        continue

    path = prefix + f
    original = open(path + "/original.jsx", 'r')
    totest = open(path + "/totest.jsx", 'w')

    totest.write(original.read())

    original.close()
    totest.close()
