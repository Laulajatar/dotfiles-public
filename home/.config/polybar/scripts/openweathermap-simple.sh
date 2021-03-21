#!/bin/sh

get_icon() {
    case $1 in
        # Icons for weather-icons
        # https://www.nerdfonts.com/cheat-sheet?set=nf-custom-
        01d) icon="盛";; # clear sky
        01n) icon="望";;
        02d) icon="";; # few clouds 
        02n) icon="";;
        03*) icon="";; # scattered clouds 
        04*) icon="";; # broken clouds 
        09d) icon="";; # shower rain   
        09n) icon="";;  
        10d) icon="";; #rain   
        10n) icon="";; 
        11d) icon="";; #thunderstorm    
        11n) icon="";; 
        13d) icon="";; #snow
        13n) icon="";; 
        50d) icon="";; #mist   
        50n) icon="";;
        *) icon="";
   esac

    echo $icon
}

KEY=""
CITY=""
UNITS="metric"
SYMBOL="°"

source ~/.config/polybar/scripts/key

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

if [ -n "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")

    echo "$(get_icon "$weather_icon")" "$weather_temp$SYMBOL"
fi
