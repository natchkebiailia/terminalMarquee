#!/bin/bash

matrix=('00100001000001000001100011000101110' '10000111000010001010100011000101110' '01100100100010001010100011000101110' '01110100011000111110100000111000001' '01110100010000100001000011000101110' '01110100010000100110000011000101110' '01100100100110000110010010100100110' '01010101011010110101101011010101001' '01110100011000110001100011000110001' '00001000010001000001000011000101110' '01110100011000110000100000111000001' '01110100010000101111100011000101110' '01111100001000011110100011000101110' '01010101011010110101100011000110001' '00100000100000100110000011000101110' '00010101011100100001000011000101110' '00111010001000011110100011000110010' '10000100001000010010100011000101110' '00100010100010001010000011000101110' '11010001010010100001000011000101110' '01010101011010101010000011000101110' '00001000010111100001000011000101110' '01010101011010110000100000111000001' '01001100011000101111000011000101110' '01010101011000100001011111000101110' '11100100101010011000111101000110010' '10001100011011010001100011000101110' '00001000010000101111100011000101110' '01010101011000011110100011000101110' '01001101100110100100000101000101110' '10000100001000011110100011000101110' '01000010100010001010000011000101110' '00001000100000100010001001001101111');

letterArr=('a' 'b' 'g' 'd' 'e' 'v' 'z' 'T' 'i' 'k' 'l' 'm' 'n' 'o' 'p' 'J' 'r' 's' 't' 'u' 'f' 'q' 'R' 'y' 'S' 'C' 'c' 'Z' 'w' 'W' 'x' 'j' 'h');

#a=${matrix[0]};
#from=0;
#length=7;
#echo $a;
#echo ${a:from:length};
#echo ${#a};
#echo $1;
#echo ${#letterArr[@]};


MATRIXWIDTH=5;
MATRIXHEIGHT=7;
INPUTTEXT="";
BINARYTEXT="";
lineArr=('' '' '' '' '' '' '');
cls=$(tput cols);
#echo $COLUMNS;
#lineArr[1]="dsfd";
#echo ${lineArr[2]};




###########passint one argument Letter########
function getPosition(){
	for (( i = 0; i < ${#letterArr[@]}; i++ )); do
   		if [ "${letterArr[$i]}" = "$1" ]; then
       			position=$i;
   		fi
	done
}
###getLineFragment(#letter,#ligneNumber)
function getLineFragment(){
	getPosition $1;
	lettetMatrix=${matrix[$position]};
	#echo $lettetMatrix;
	from=$(($2*$MATRIXWIDTH-$MATRIXWIDTH));
	fragment=${lettetMatrix:from:MATRIXWIDTH};
}

#getLineFragment 'b' 5;

function constructString(){
	
	for (( l=1; l<=$MATRIXHEIGHT; l++ ))
	do
		lineNum="$l";
		str="";
		for (( ss=1; ss<$cls; ss++ ))
		do
			str+=" ";
		done
		for (( s=0; s<${#INPUTTEXT}; s++ ))
		do
			getLineFragment ${INPUTTEXT:s:1} lineNum;
			#echo $fragment;
			str+=" ";
			for (( t=0; t<${#fragment}; t++ ))
			do
				if [[ ${fragment:t:1} -eq 0 ]] && [ 1 -eq 1 ]
  				then
  					str+="░";
  				else
  					str+="█";
  				fi
			done
		done
		lineArr[$lineNum]="$str";
		#echo ${lineArr[$lineNum]};
	done
	#printResult 50;
	#echo ${#lineArr[1]}; 1 დან აქამდე დაბეჭდოს
	startAnimation  ${#lineArr[1]};
}

function printResult(){
	pos=$1;
	for ln in {1..7}
	do
		a="${lineArr[$ln]}";
		b=${a:pos:cls};
		echo "$b";
	done
}

function startAnimation(){
	stop=$1;
	echo $start;
	for (( q=1; q<=$stop; q++))
	do
		clear;
		printResult $q;
		sleep 0.05;
	done;
	echo "Bye! :D"
}

if [[ $# -eq 0 || $# -gt 1 ]]
  then
    echo "Ivalid arguments";
    echo "Usage: $0 <text here in quotes>";
else
	INPUTTEXT=$1;
	constructString;
fi




















