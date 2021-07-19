#!/bin/bash

echo "File is open"
yes_no() {
	while true; do
		read -p "$* [y/n]" yn
		case $yn in
			[Yy]*) yes_or_no="yes" && return 0 ;;
			[Nn]*) printf "Aborted\n\n" ; yes_or_no="no" && return 1;;
		esac
		yes_or_no="null"
	done
}
echo "end of funcion"
#yes_no
[ -z yes_no ] && return
#functionToBreak(){
#	echo "functionToBreak start"
#	if [-z yes_no] && return
#}
#functionToBreak
echo "end file"
