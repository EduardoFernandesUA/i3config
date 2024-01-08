#!/bin/bash

BRIGHT=$(sed -n '1p' ~/.config/i3/redshift.data)
NIGHT=$(sed -n '2p' ~/.config/i3/redshift.data)



case "$1" in
    "addbright")
        BRIGHT=$(echo "if((${BRIGHT} + 0.05) <= 1.0) ${BRIGHT} + 0.05 else 1.0" | bc)
        ;;
    "rmbright")
        BRIGHT=$(echo "if((${BRIGHT} - 0.05) > 0) ${BRIGHT} - 0.05 else 0.05" | bc)
        ;;
    "addnight")
        NIGHT=$(echo "if((${NIGHT} + 100) <= 12000) ${NIGHT} + 100 else 12000" | bc)
        ;;
    "rmnight")
        NIGHT=$(echo "if((${NIGHT} - 100) >= 1000) ${NIGHT} - 100 else 1000" | bc)
        ;;
esac

sed "1s/.*/${BRIGHT}/" ~/.config/i3/redshift.data > temp_file && mv temp_file ~/.config/i3/redshift.data
sed "2s/.*/${NIGHT}/" ~/.config/i3/redshift.data > temp_file && mv temp_file ~/.config/i3/redshift.data
        
redshift -P -b $BRIGHT -O $NIGHT
# notify-send "Current Display $BRIGHT $NIGHT"
