 Please Ignore for now, I will make a better makefile in the future
# I promisse

all:	compile	upload

compile:
	@echo "Compiling for 65c02"
	@vasm6502_oldstyle -Fbin -dotdir -wdc02 main.s | grep :

upload:
	@echo "Uploading"
	@minipro -p SST39SF040 -w a.out -Sy

