#!/bin/bash

echo "Compiling for 65c02"

# Removing previous build

rm -rf build
mkdir build

bold=$(tput bold)
normal=$(tput sgr0)

build(){
	output=$(vasm6502_oldstyle -Fbin -dotdir -wdc02 src/main.s -o build/a.out | grep :)

	if `find build/a.out* > /dev/null`;
	then 
		echo -e "\n\e[0;32m${bold}Compiled Succsessfully${normal}"
		sh upload.sh
	else 
		echo -e "\n\e[0;31m${bold}Error while Compiling${normal}"
	fi

	echo ""
	echo $output | sed 's/bytes /bytes\n/g'
}

# Checking dependencies

if command -v vasm6502_oldstyle > /dev/null 2<&1;
then
	build
else
	echo -e "\n\e[0;31m${bold}vasm6502_oldstyle not found${normal}"
	echo "Aborting build..."
fi
