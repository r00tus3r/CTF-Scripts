import hashlib

f = open('brute', 'r').read()
brute = f.split(', ')

question_marks = {0: 'Green',
        21 : 'Red',
        37 : 'Light green',
        97 : 'Blue',
        1337 : 'Rainbow',
        }

for test in brute:
    m = hashlib.sha256()
    m.update(test)
    m.update('P4ssw0rdS4lt')
    if m.hexdigest() == '024800ace2ec394e6af68baa46e81dfbea93f0f6730610560c66ee9748d91420':
        inp = test.encode('hex')
        print(inp)
        for i in range(0, len(inp), 2):
            print(question_marks[int(inp[i:i+2], 16)])

        exit()

# Flag: ALLES{1TS_A_DINO}
