fan1="$(sensors | grep -i fan | head -n 1 | awk '{print $2}')"
fan2="$(sensors | grep -i fan | tail -n 1 | awk '{print $2}')"

fan1="$(($fan1/100))"
fan2="$(($fan2/100))"

# fan1="$(echo $fan1 | sed -r 's/.{1}/&./')"
# fan2="$(echo $fan2 | sed -r 's/.{1}/&./')"

yellow="^c#b27e3e^"
red="^c#924747^"
block="^c#a36943^"
debug="^c#ffffff^"

fan_t="$(( ($fan1 + $fan2) / 2 ))"
fan_t="$(echo $fan_t | sed -r 's/.{1}/&./')"

if [[ $fan_t == "0." ]]; then
	echo "󰈐 0.0"
elif [[ ${fan_t%.*} -ge "3" ]]; then
	echo "${red}󰈐 $fan_t${block}"
else
	echo "󰈐 $fan_t"
fi
# elif [[ $fan2 == "0." ]]; then
# 	echo "󱑲 $fan1 | 󱑳 0"
# else
# 	echo "󱑲 $fan1 | 󱑳 $fan2"
# fi

# put the script into an IF statement, so it activates only if fans
# are used, so it dosent clutter the process in the background.
