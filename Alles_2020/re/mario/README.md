# Prehistoric mario
### Category: Reverse Engineering, Difficulty: Medium

### tl;dr
Play the game, hit the question mark tiles in a particular order, pass the checks, get flag!

### Longer version
I always had fun playing mario, so I proceeded to installed the game on my android phone and did a quick check of the functionalities in the app.


So, it looks like we need to hit the question mark tiles in a particular order to get the flag, maybe the rainbow colored tile calls the flag check function.

Now is the time to confirm this speculation. I proceeded to decompile the apk and extract the sources to look at the images/libraries/java code etc. I used `apktool`, `dex2jar` and `jd-gui` for this.

Looking at decompied java code I found a `checkFlag()` function in  `MyPlatformer.java`. Taking a closer look at the checkFlag function reveiled that the different colored question mark tiles had different values and that we need to hit them in a particular order to pass the checks. The order of color of tiles is stored in a array which is hashed using `SHA-256` and if the hash is correct, the program goes on to decrypt the flag.

```
  private void checkFlag() {
    byte[] arrayOfByte = new byte[11];
    arrayOfByte[0] = 0;
    arrayOfByte[1] = 0;
    arrayOfByte[2] = 0;
    arrayOfByte[3] = 0;
    arrayOfByte[4] = 0;
    arrayOfByte[5] = 0;
    arrayOfByte[6] = 0;
    arrayOfByte[7] = 0;
    arrayOfByte[8] = 0;
    arrayOfByte[9] = 0;
    arrayOfByte[10] = 0;
    arrayOfByte;
    TiledMapTileLayer tiledMapTileLayer = (TiledMapTileLayer)this.map.getLayers().get("questionmarks");
    byte b = 0;
    int i = 0;
    while (b < 100) {
      byte b1 = 0;
      while (b1 < 100) {
        noSuchAlgorithmException = tiledMapTileLayer.getCell(b, b1);
        int j = i;
        if (noSuchAlgorithmException != null)
          if (!noSuchAlgorithmException.getTile().getProperties().containsKey("questionmarkType")) {
            j = i;
          } else {
            j = ((Integer)noSuchAlgorithmException.getTile().getProperties().get("questionmarkType")).intValue();
            if (j == 1337) {
              j = i;
            } else {
              arrayOfByte[i] = (byte)(byte)j;
              j = i + 1;
            } 
          }  
        b1++;
        i = j;
      } 
      b++;
    } 
    try {
      noSuchAlgorithmException = MessageDigest.getInstance("SHA-256");
    } catch (NoSuchAlgorithmException noSuchAlgorithmException) {
      noSuchAlgorithmException.printStackTrace();
      noSuchAlgorithmException = null;
    } 
    noSuchAlgorithmException.update(arrayOfByte);
    noSuchAlgorithmException.update("P4ssw0rdS4lt".getBytes());
    if (toHex(noSuchAlgorithmException.digest()).equals("024800ace2ec394e6af68baa46e81dfbea93f0f6730610560c66ee9748d91420"))
      try {
        noSuchAlgorithmException.update(arrayOfByte);
        noSuchAlgorithmException.update("P4ssw0rdS4lt".getBytes());
        noSuchAlgorithmException.update(arrayOfByte);
        byte[] arrayOfByte1 = noSuchAlgorithmException.digest();
        byte[] arrayOfByte2 = Base64Coder.decode(Gdx.files.internal("flag_enc").readString());
        SecretKeySpec secretKeySpec = new SecretKeySpec();
        this(arrayOfByte1, 0, arrayOfByte1.length, "RC4");
        Cipher cipher = Cipher.getInstance("RC4");
        cipher.init(2, secretKeySpec, cipher.getParameters());
        arrayOfByte2 = cipher.doFinal(arrayOfByte2);
        String str = new String();
        this(arrayOfByte2);
        FileHandle fileHandle = Gdx.files.local("map_flag.tmx");
        fileHandle.writeString(str, false);

```

To find the order of the colored question mark tiles, we need to find the value of each color. We can easily figure that out looking at the `map.tmx` and `tileSet.png` in the assets folder. We get the index of each colored tile by looking at the image, and value of the tile by lookin in `map.tmx`. There might be a better way to do that but this seemed to work.

To get the correct input order, I wrote a bruteforce script in C and python.

C code to get all possible input combination, because C is faster than python.
```
#include <bits/stdc++.h>
using namespace std;
void printKLengthString(char set[], string sequence, int n, int k) {
   if (k == 0){
      cout<<sequence<<", ";
      return;
   }
   for (int i = 0; i < n; i++){
      string newSequence;
      newSequence=sequence+set[i];
      printKLengthString(set, newSequence, n, k - 1);
   }
}
int main() {
   char set[] = {0, 21, 37, 97};
   int n = 4;
   int k = 11;
   printKLengthString(set, "", n, k);
}
```

Python code to get the correct value among all the bruteforced values.
```
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
```

Correct order printed after running the scripts.
```
1500612515252561612515
Red
Green
Blue
Light green
Red
Light green
Light green
Blue
Blue
Light green
Red
```

Now that we have figured out the input order, the final step is to play the game and get the flag.
