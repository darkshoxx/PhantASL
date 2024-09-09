// WIP this pointermap does not seem to work
// state("scummvm", "Phantasmagoria (GOG) SVM 2.8.1")
// {
//     byte chapter : "scummvm.exe",  0x03BA8480, 0x150, 0x98, 0x98, 0x38, 0x18, 0x58, 0x1A8;

// }
state("scummvm", "Phantasmagoria (GOG) SVM 2.7.1")
{
    byte chapter : "scummvm.exe",  0x05276600, 0x40, 0x58, 0x0, 0x10, 0x10, 0x18, 0x1AA;

}
state("scummvm", "Phantasmagoria (GOG) SVM 2.7.0")
{
    byte chapter : "scummvm.exe", 0x05106B80, 0xA0, 0x0, 0x10, 0x10, 0x18, 0x1AA;

}
state("scummvm", "Phantasmagoria (GOG) SVM 2.8.0git3636")
{
    // int chapter : "scummvm.exe", 0x06ACBC80, 0x40, 0xE8, 0x0, 0x10, 0x10, 0x18, 0x1A8;
    byte chapter: "scummvm.exe", 0x06ACBC80, 0x40, 0xE8, 0x0, 0x10, 0x10, 0x18, 0x1AA;
}
init {
	//i robbed this md5 code from Gelly's Myst autosplittter,
    //who robbed it from CptBrian's RotN autosplitter,
	//shoutouts to both.
	byte[] exeMD5HashBytes = new byte[0];
	using (var md5 = System.Security.Cryptography.MD5.Create()) {
		using (var s = File.Open(modules.First().FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)) {
			exeMD5HashBytes = md5.ComputeHash(s);
		}
	}
	var MD5Hash = exeMD5HashBytes.Select(x => x.ToString("X2")).Aggregate((a, b) => a + b);
	print("[Sh0xx] MD5Hash: " + MD5Hash.ToString()); //Lets DebugView show me the MD5Hash of the game executable, which is actually useful.



	if (MD5Hash == "572836CEE7771BFD9F1FBB3AECDF1AC3") {
		print("[Sh0xx] GOG SVM 2.7.1");
		version = "Phantasmagoria (GOG) SVM 2.7.1";
	} else if (MD5Hash == "4A487BC416CC25451A63C076C6CD914F") {
		print("[Sh0xx] GOG SVM 2.7.0");
		version = "Phantasmagoria (GOG) SVM 2.7.0";
    } else if (MD5Hash == "F6F51EF8BA5D908953B1288BCEEF3F4C") {
		print("[Sh0xx] GOG SVM 2.8.0git3636");
		version = "Phantasmagoria (GOG) SVM 2.8.0git3636";
    } else if (MD5Hash == "E87AB55F28CA91E1B0D30E6ECACAE02F") {
		print("[Sh0xx] GOG SVM 2.8.1");
		version = "Phantasmagoria (GOG) SVM 2.8.1";
	}
    print("[Sh0xx] INIT");
    vars.ch7 = 7;
}

startup {
    print("[Sh0xx] STARTUP");
}
start {
    print("[Sh0xx] Chapter: " + current.chapter);

    // print("[Sh0xx] Address: " + current.testaddress.ToString());
    if (current.chapter != old.chapter ) {
        return true;
    }

}



split
{
    print("[B0sh] SPLIT");
    print("Chapter: " + current.chapter);
    if (current.chapter != old.chapter ) {
        return true;
    }

}