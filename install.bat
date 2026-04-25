@echo off
setlocal enabledelayedexpansion
title CYBER CHAIN SNAKE INSTALLER

:: Ordner auf Desktop erstellen
set "FOLDER=%USERPROFILE%\Desktop\CyberSnake"
if not exist "%FOLDER%" mkdir "%FOLDER%"
cd /d "%FOLDER%"

:: 1. Die HTML-Datei (Spiel) erstellen
echo ^<html^>^<body style="margin:0;background:#000;display:flex;justify-content:center;align-items:center;height:100vh;overflow:hidden"^> > index.html
echo ^<canvas id="g" width="400" height="400" style="border:4px solid #0f0;box-shadow:0 0 20px #0f0"^>^</canvas^> >> index.html
echo ^<script^> >> index.html
echo c=document.getElementById("g");x=c.getContext("2d");s=20;sn=[{x:200,y:200}];dx=s;dy=0;ax=80;ay=80; >> index.html
echo function m(){ >> index.html
echo x.fillStyle="#000";x.fillRect(0,0,400,400);x.fillStyle="#f05";x.fillRect(ax,ay,s-2,s-2); >> index.html
echo h={x:sn[0].x+dx,y:sn[0].y+dy};if(h.x^<0)h.x=380;if(h.x^>=400)h.x=0;if(h.y^<0)h.y=380;if(h.y^>=400)h.y=0; >> index.html
echo sn.unshift(h);if(h.x==ax^&^&h.y==ay){ax=Math.floor(Math.random()*20)*s;ay=Math.floor(Math.random()*20)*s}else{sn.pop()} >> index.html
echo x.fillStyle="#0f0";sn.forEach(p=^>x.fillRect(p.x,p.y,s-2,s-2));setTimeout(m,100)} >> index.html
echo window.addEventListener("touchstart",e=^>{tx=e.touches[0].clientX;ty=e.touches[0].clientY;}); >> index.html
echo window.addEventListener("touchmove",e=^>{if(!tx)return;dX=tx-e.touches[0].clientX;dY=ty-e.touches[0].clientY; >> index.html
echo if(Math.abs(dX)^>Math.abs(dY)){if(dX^>0^&^&dx==0){dx=-s;dy=0}else if(dX^<0^&^&dx==0){dx=s;dy=0}} >> index.html
echo else{if(dY^>0^&^&dy==0){dy=-s;dx=0}else if(dY^<0^&^&dy==0){dy=s;dx=0}}tx=null;});m(); >> index.html
echo ^</script^>^</body^>^</html^> >> index.html

:: 2. Die Bot-Datei (Python) erstellen
echo from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup, WebAppInfo > snake_bot.py
echo from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes >> snake_bot.py
echo TOKEN = "8627558245:AAFUor8YxwYr2WzjmnHsSpcC8bjs-4ff9nY" >> snake_bot.py
echo WEB_APP_URL = "https://cyber-snake-8627.loca.lt" >> snake_bot.py
echo async def start(u, c): >> snake_bot.py
echo     kb = [[InlineKeyboardButton("🎮 PLAY CYBER CHAIN", web_app=WebAppInfo(url=WEB_APP_URL))]] >> snake_bot.py
echo     await u.message.reply_text("--- CYBER CHAIN 8627 ---\nTOUCH SYSTEM READY", reply_markup=InlineKeyboardMarkup(kb)) >> snake_bot.py
echo if __name__ == '__main__': >> snake_bot.py
echo     app = ApplicationBuilder().token(TOKEN).build() >> snake_bot.py
echo     app.add_handler(CommandHandler("start", start)) >> snake_bot.py
echo     print("Bot online..."); app.run_polling() >> snake_bot.py

:: 3. Ausführung
echo [OK] Dateien erstellt in %FOLDER%
pip install python-telegram-bot --upgrade
start /min python -m http.server 80
start cmd /k "npx localtunnel --port 80 --subdomain cyber-snake-8627"
echo.
echo ==================================================
echo BOT STARTET JETZT...
echo ==================================================
python snake_bot.py
pause