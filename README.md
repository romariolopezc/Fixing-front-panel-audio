# Fixing-front-panel-audio
Having both speakers and headphones plugged in and switching in software on-the-fly.

Run
```sh
git clone https://github.com/romariolopezc/Fixing-front-panel-audio
cd Fixing-front-panel-audio
chmod +x Fixing-front-panel-audio.sh
./Fixing-front-panel-audio.sh
```

Depending if you have a graphic card, edit the scrip to disable auto-mute. 
With graphic card `amixer -c 1`
Witout graphic card `amixer -c 0`

Tested with ArchLinux.
