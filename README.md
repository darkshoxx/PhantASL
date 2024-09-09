# PhantASL
Autosplitter for Phantasmagoria

[Sh0xx] MD5Hash: E87AB55F28CA91E1B0D30E6ECACAE02F 

How To Update to newest version:
1. Get CheatEngine and DebugView
2. Run DebugView, add file in LiveSplit/activate corresponding layout
3. make sure DebugView prints messages containing [Sh0xx]
4. Run Game, search DebugView Log for line starting with "[Sh0xx] MD5Hash:" and note the hash 
5. Make new else if block above the print("[Sh0xx] INIT"); line in the code:
```c#
    } else if (MD5Hash == "<INSERT NOTED HASH HERE>") {
		print("[Sh0xx] GOG SVM <INSERT SCUMMVM VERSION NUMBER HERE>");
		version = "Phantasmagoria (GOG) SVM <INSERT SCUMMVM VERSION NUMBER HERE>";
	}
```
6. Find offsets:
    - open CheatEngine, open scummvm.exe (running Phantas 1)
    - find 8 byte value of current chapter in either hex or decimal (best start on 7):
        ```txt
        7 0000 = 458752
        6 0000 = 393216
        5 0000 = 327680
        4 0000 = 262144
        3 0000 = 196608
        2 0000 = 131072
        1 0000 = 065536
        ```
    - Keep switching until one address remains.
        - for example: 
            - go chapter 7, first scan 458752
            - go chapter 5, next scan 327680
    - Double click that address, give it name (like Add descripton, "Chapter Pointer")
    - Rightclick address, generate Pointermap, save as "Pmap1"
    - Close game, restart game, open scummvm.exe in cheatengine AGAIN. Find Chapter pointer again. 
    - Rightclick pointer "Pointer Scan for this Address" make sure to compare against previous pointermap.
    - Find "pointerscan result" in saved addresses.
    - pick first, double click Address.
    - copy sequence of offsets in same format as in ASL file:
        - "scummvm.exe", 0xADRESS ,0xADRESS2, ...
    - create block at start of file:
    ```c#
    state("scummvm", "Phantasmagoria (GOG) SVM <INSERT SCUMMVM VERSION NUMBER HERE>")
    {
        byte chapter : "scummvm.exe",  <INSERT POINTER SEQUENCE HERE>

    }
    ``` 
    - Make sure to test with DebugView, it should always display the current Chapter.