#!/usr/bin/env bash

board=("1" "2" "3" "4" "5" "6" "7" "8" "9" "A" "B" "C" "D" "E" "F" "_");

prntBoard() {
        for row in 0 4 8 12; do
                printf "%s\n" "-------------------------"
                printf "%s\n" "|     |     |     |     |"
                printf "|  %s  |  %s  |  %s  |  %s  |\n" ${board[$row]} ${board[$row + 1]} ${board[$row + 2]} ${board[$row + 3]}
                printf "%s\n" "|     |     |     |     |"
        done
        printf "%s\n\n" "-------------------------"
}

getIndex() {
        value="${1}"
        for i in "${!board[@]}"; do
                if [[ "${board[$i]}" = "${value}" ]]; then
                        echo "${i}"
                fi
        done
}

mvU() {
        blank="$(getIndex "_")"
        if [ $blank != 12 ] && [ $blank != 13 ] && [ $blank != 14 ] && [ $blank != 15 ]; then
                tmp=${board[$blank]}
                board[$blank]=${board[$blank + 4]}
                board[$blank + 4]=$tmp
        fi
}

mvD() {
        blank="$(getIndex "_")"
        if [ $blank != 0 ] && [ $blank != 1 ] && [ $blank != 2 ] && [ $blank != 3 ]; then
                tmp=${board[$blank]}
                board[$blank]=${board[$blank - 4]}
                board[$blank - 4]=$tmp
        fi
}

mvL() {
        blank="$(getIndex "_")"
        if [ $blank != 3 ] && [ $blank != 7 ] && [ $blank != 11 ] && [ $blank != 15 ]; then
                tmp=${board[$blank]}
                board[$blank]=${board[$blank + 1]}
                board[$blank + 1]=$tmp
        fi
}

mvR() {
        blank="$(getIndex "_")"
        if [ $blank != 0 ] && [ $blank != 4 ] && [ $blank != 8 ] && [ $blank != 12 ]; then
                tmp=${board[$blank]}
                board[$blank]=${board[$blank - 1]}
                board[$blank - 1]=$tmp
        fi
}

while true; do
        clear
        prntBoard
        read -rsn1 input
        if [ $input = "q" ]; then
                break;
        elif [ $input = "w" ] || [ $input = "i" ]; then
                mvU
        elif [ $input = "a" ] || [ $input = "j" ]; then
                mvL
        elif [ $input = "s" ] || [ $input = "k" ]; then
                mvD
        elif [ $input = "d" ] || [ $input = "l" ]; then
                mvR
        elif [ $input = "W" ] || [ $input = "I" ]; then
                mvU
		mvU
		mvU
        elif [ $input = "A" ] || [ $input = "J" ]; then
                mvL
		mvL
		mvL
        elif [ $input = "S" ] || [ $input = "K" ]; then
                mvD
		mvD
		mvD
        elif [ $input = "D" ] || [ $input = "L" ]; then
                mvR
		mvR
		mvR
        fi
done
