# WeatherPaper a weather/time based wallpaper switcher.

<img alt="Static Badge" src="https://img.shields.io/badge/Hyprland-Supported-%233f61db?style=flat&logo=hyprland&logoColor=%23ffffff">  <img alt="Static Badge" src="https://img.shields.io/badge/Plasma-Supported-%233f61db?style=flat&logo=kdeplasma&logoColor=%23ffffff">


WeatherPaper is an opensource wallpaper changer that runs in the background, it pulls local weather data from [Openweathermap](https://openweathermap.org) and changes the wallpaper based on the weather and time. It currently supports Hyprland and Plasma enviornments. With more to be added eventually.

## Wallpaper Changing

https://github.com/user-attachments/assets/659a3663-2d95-4400-9878-48f4e6f60b39

Example of the wallpaper changing time and weather. 

## Instalation

```
cd
git clone https://github.com/SageTheFeminineBoy/WeatherPaper
```

After cloning the repository you need to sign up on [Openweathermap's sign up page](https://home.openweathermap.org/users/sign_up), or if you already have an account you can skip this step. After you have created an account or signed in you can copy your api key from [this page](https://home.openweathermap.org/api_keys). You can now paste this key into your file in the Apikey section. After this you need to search for you're cities Openweathermap id, while Openweathermap no longer shows the city id in urls, you can easily find them by searching your cities name and Openweathermap id. Again once you find it you can paste it into the file this time under the City section.

Hyprland
```
sudo pacman -S awww
```
Once awww is installed add these lines to your hyprland.conf file.
```
exec-once = awww-daemon
exec-once = ~/WeatherPaper/WeatherPaperHypr.sh
```
And now you can just restart Hyprland and it should now be running.

KDE Plasma
```
cd ~/WeatherPaper
sudo mv WeatherPaperKDE.sh.desktop
```




