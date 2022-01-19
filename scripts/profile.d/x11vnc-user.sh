#! Precisa verificar se o Xorg estará rodando, pois se não tiver não inicia o VNC
/usr/bin/x11vnc -loop5000,15 -forever -noxdamage -repeat -rfbauth /opt/sicoob/passwdvnc.pwd -autoport 5900 -shared -o .local/share/x11vnc.log -q &
