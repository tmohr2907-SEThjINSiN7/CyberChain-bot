@echo off
title CYBER CHAIN - PYTHON ONLY VERSION
cd /d "%~dp0"

:: 1. Bot-Datei mit Port-Anpassung erstellen
(
echo from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup, WebAppInfo
echo from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes
echo TOKEN = "8627558245:AAFUor8YxwYr2WzjmnHsSpcC8bjs-4ff9nY"
echo # Wir nutzen hier bore.pub als Tunnel
echo WEB_APP_URL = "http://bore.pub:8000" 
echo async def start(u, c^):
echo     kb = [[InlineKeyboardButton("🎮 PLAY CYBER CHAIN", web_app=WebAppInfo(url=WEB_APP_URL^))]]
echo     await u.message.reply_text("--- CYBER CHAIN 8627 ---\nSYSTEM ONLINE", reply_markup=InlineKeyboardMarkup(kb^))
echo if __name__ == '__main__':
echo     app = ApplicationBuilder(^).token(TOKEN^).build(^)
echo     app.add_handler(CommandHandler("start", start^))
echo     print("Bot online! Warte auf Tunnel..."^); app.run_polling(^)
) > snake_bot.py

:: 2. Webserver auf Port 8000 starten
start /min python -m http.server 8000

:: 3. Tunnel starten (Falls bore.exe im Ordner liegt)
if exist "bore.exe" (
    start cmd /k "bore local 8000 --to bore.pub"
) else (
    echo BITTE bore.exe in diesen Ordner kopieren!
    pause
    exit
)

:: 4. Bot starten
python snake_bot.py
pause