#!/usr/bin/env bash
Apikey="" # Your Openweathermap api key
City="" #Your cities Openweathermap id
Updatetimer=5
Wallpaperdir="$HOME/WeatherPaper/Wallpapers" # Path to the Wallpaper folder, most likely being "$HOME/WeatherPaper/Wallpapers"
get_weather() {
    Weather_JSON=$(curl -s "https://api.openweathermap.org/data/2.5/weather?id=$City&appid=$Apikey")
    Weather=$(echo "$Weather_JSON" | python3 -c "import sys, json; data = json.load(sys.stdin); print(data['weather'][0]['main'])")
    case "$Weather" in
        Clear|Clouds) echo "Clear" ;;
        Rain|Drizzle) echo "Rain" ;;
        Thunderstorm) echo "Thunder" ;;
        Snow) echo "Snow" ;;
        *) echo "Clear" ;;
    esac
}

get_time_of_day() {
    Hour=$(date +%H)
    if [ $Hour -ge 23 ] || [ $Hour -lt 05 ]; then
        echo "Night"
    elif [ $Hour -ge 05 ] && [ $Hour -lt 12 ]; then
        echo "Morning"
    elif [ $Hour -ge 12 ] && [ $Hour -lt 19 ]; then
        echo "Day"
    elif [ $Hour -ge 19 ] && [ $Hour -lt 23 ]; then
        echo "Evening"
    else
        echo "Night"
    fi
}

set_wallpaper() {
    local Wallpaper=$1
    if [[ "$XDG_CURRENT_DESKTOP" == *"KDE"* ]]; then

        plasma-apply-wallpaperimage "$WALL"
    else
        return
    fi
}

while true; do
    Weather=$(get_weather)
    Time=$(get_time_of_day)
    Wallpaper="$Wallpaperdir/$Weather/$Time.png"

    if [ -f "$Wallpaper" ]; then
        sleep 30
        set_wallpaper "$Wallpaper"
    else
        echo "${Wallpaperpath}/${Weather}/${Time}.png"
    fi
    sleep $Updatetimer
done
