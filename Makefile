# Please Ignore for now, I will make a better makefile in the future
# I promisse

# ToDo:
# Ignore Upload when no programmer found

all:	compile	upload

compile:
	@echo "Compiling for 65c02"
	@vasm6502_oldstyle -Fbin -dotdir -wdc02 src/main.s -o build/kernel.bin | grep :

upload:
	@echo "Uploading"
	@minipro -p SST39SF040 -w build/kernel.bin -Sy

