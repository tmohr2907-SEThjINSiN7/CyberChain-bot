@echo off
cls
echo ==========================================
echo CYBER CHAIN 8627 - AUTO INSTALLER
echo ==========================================

:: 1. Ordner vorbereiten
set "targetDir=%USERPROFILE%\Desktop\CyberSnake"
if not exist "%targetDir%" mkdir "%targetDir%"
cd /d "%targetDir%"

:: 2. Python Files erstellen (ohne CMD-Fehler)
echo [1/3] Erstelle Bot-Dateien in %targetDir%...

echo from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup, WebAppInfo > bot.py
echo from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes >> bot.py
echo TOKEN = "8627558245:AAFUor8YxwYr2WzjmnHsSpcC8bjs-4ff9nY" >> bot.py
echo WEB_APP_URL = "https://cyber-chain-snake.loca.lt" >> bot.py
echo async def start(u, c): >> bot.py
echo     kb = [[InlineKeyboardButton("🎮 START CYBER SNAKE", web_app=WebAppInfo(url=WEB_APP_URL))]] >> bot.py
echo     await u.message.reply_text("--- CYBER CHAIN 8627 ---\nSYSTEM ACTIVE", reply_markup=InlineKeyboardMarkup(kb)) >> bot.py
echo if __name__ == '__main__': >> bot.py
echo     app = ApplicationBuilder().token(TOKEN).build() >> bot.py
echo     app.add_handler(CommandHandler("start", start)) >> bot.py
echo     print("Bot online..."); app.run_polling() >> bot.py

:: 3. Spiel erstellen
echo ^<body style="margin:0;background:#000;overflow:hidden"^>^<canvas id="g"^>^</canvas^>^<script^> >> index.html
echo c=document.getElementById("g");x=c.getContext("2d");s=20;sn=[{x:200,y:200}];dx=s;dy=0; >> index.html
echo function dr(){c.width=window.innerWidth;c.height=window.innerHeight;x.fillStyle="#000";x.fillRect(0,0,c.width,c.height);x.fillStyle="#0f0"; >> index.html
echo sn.forEach(p=^>x.fillRect(p.x,p.y,s-2,s-2));h={x:sn[0].x+dx,y:sn[0].y+dy};sn.unshift(h);sn.pop();setTimeout(dr,100)} >> index.html
echo window.addEventListener("touchstart",e=^>{tx=e.touches[0].clientX;ty=e.touches[0].clientY;}); >> index.html
echo window.addEventListener("touchmove",e=^>{dx=(e.touches[0].clientX^>tx)?s:(e.touches[0].clientX^<tx)?-s:dx;dy=(e.touches[0].clientY^>ty)?s:(e.touches[0].clientY^<ty)?-s:dy;dr();}); >> index.html
echo dr();^</script^>^</body^> >> index.html

:: 4. Abhängigkeiten
echo [2/3] Installiere Schnittstellen...
pip install python-telegram-bot --upgrade
pip install localtunnel-py

echo [3/3] Starte System...
echo Öffne deinen Bot in Telegram und tippe /start
start /min python -m http.server 80
start /min lt --port 80 --subdomain cyber-chain-snake
python bot.py
pause