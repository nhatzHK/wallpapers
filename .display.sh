#!/usr/bin/bash

quit=0
for i in $(ls); do
    printf "Displaying $i\n\n"
    feh $i & FEH_PID=$!

    next=1
    quit=1
    until [[ $next == 0 ]] || [[ $quit -eq 0 ]]; do
        read -n 1 -p ":>" watcher
        case $watcher in
            N|n)
                kill $FEH_PID
                next=0
                ;;
            Q|q)
                kill $FEH_PID
                printf "\n"
                quit=0
                break
                ;;
            H|h)
                printf "\nPress n to display the next image\n"
                printf "Press q to exit the script\n"
                printf "Press h to display this help message\n"
                ;;
            *)
                printf "\nUnknown option\n"
                printf "Press h for help\n"
                ;;
        esac
    done

    if [[ quit -eq 0 ]]; then
        break
    fi

done
