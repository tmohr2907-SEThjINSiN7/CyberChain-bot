from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup, WebAppInfo 
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes 
TOKEN = "8627558245:AAFUor8YxwYr2WzjmnHsSpcC8bjs-4ff9nY" 
WEB_APP_URL = "https://cyber-snake-8627.loca.lt" 
async def start(u, c): 
    kb = [[InlineKeyboardButton("🎮 PLAY CYBER CHAIN", web_app=WebAppInfo(url=WEB_APP_URL))]] 
    await u.message.reply_text("--- CYBER CHAIN 8627 ---\nTOUCH SYSTEM READY", reply_markup=InlineKeyboardMarkup(kb)) 
if __name__ == '__main__': 
    app = ApplicationBuilder().token(TOKEN).build() 
    app.add_handler(CommandHandler("start", start)) 
    print("Bot online..."); app.run_polling() 
