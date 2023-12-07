#!/bin/sh

echo -e "\nUploading..."

bold=$(tput bold)
normal=$(tput sgr0)

upload(){
	output=`minipro -p SST39SF040 -w build/a.out -Sy`
}

# Checking dependencies

if command -v minipro > /dev/null 2<&1;
then 
	upload
else 
	echo -e "\n\e[0;31m${bold}minipro not found${normal}"
	echo "Aborting upload..."
fi
