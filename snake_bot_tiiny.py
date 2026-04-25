from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup, WebAppInfo 
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes 
TOKEN = "8627558245:AAFUor8YxwYr2WzjmnHsSpcC8bjs-4ff9nY" 
URL = "https://cybersnake7.tiiny.site" 
async def start(u, c): 
    btn = InlineKeyboardButton("PLAY CYBER CHAIN", web_app=WebAppInfo(url=URL)) 
    kb = InlineKeyboardMarkup([[btn]]) 
    await u.message.reply_text("--- CYBER CHAIN ---\nSYSTEM ONLINE", reply_markup=kb) 
if __name__ == '__main__': 
    app = ApplicationBuilder().token(TOKEN).build() 
    app.add_handler(CommandHandler("start", start)) 
    print("--- BOT STARTET JETZT ---") 
    app.run_polling() 
