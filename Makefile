CC=m68k-amigaos-gcc
AS=m68k-amigaos-as

CFLAGS = -Wall -noixemul -g -Os -fomit-frame-pointer
LDFLAGS = -noixemul -nostartfiles


popcli: PopCLI.o popsup.o
	$(CC) -o popcli popsup.o PopCLI.o $(LDFLAGS)
	ls -l popcli
	cp popcli ~/Documents/FS-UAE/Hard\ Drives/Amiga13/
	cp popcli ~/Documents/FS-UAE/Hard\ Drives/13hd/t/asm/
	cp popcli ~/Documents/FS-UAE/Hard\ Drives/AmigaHD/t/



clean:
	rm -rf *.o popcli *~

