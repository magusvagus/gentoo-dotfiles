#/bin/sh -c "amixer get Master | tail -n1 | grep -Po '\\[\\K[^%]*' | head -n1"

function get_vol() { /bin/sh -c "amixer get Master | tail -n1 | grep -Po '\\[\\K[^%]*' | head -n1" ; } ; VOL=$(get_vol) ; RED='\033[0;31m' ; NC='\033[0m' ; GR='\033[0;32'; if [ $VOL -ge 50 ]; then printf "${RED}$VOL${NC}"; else echo $VOL; fi





