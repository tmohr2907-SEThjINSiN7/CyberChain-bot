from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup, WebAppInfo 
from telegram.ext import ApplicationBuilder, CommandHandler, MessageHandler, filters 
import zipfile, os 
TOKEN = "8627558245:AAFUor8YxwYr2WzjmnHsSpcC8bjs-4ff9nY" 
GIT_URL = "https://tmohr2907-SEThjINSiN7.github.io/CyberChain-bot/" 
async def start(u, c): 
    kb = InlineKeyboardMarkup([[InlineKeyboardButton("?? OPEN CYBER-CHAIN DASHBOARD", web_app=WebAppInfo(url=GIT_URL))]]) 
    await u.message.reply_text("--- AI CORE 8627 ACTIVE ---\nRepo: CyberChain-bot\n\nSende ein Foto, um es als NFT zu sichern!", reply_markup=kb) 
async def nft_handler(u, c): 
    await u.message.reply_text("Processing NFT... Code wird in ZIP gesichert.") 
    with zipfile.ZipFile('CyberChain_Update.zip', 'w') as z: 
        z.write('index.html'); z.write('bot.py') 
    await u.message.reply_document(open('CyberChain_Update.zip', 'rb')) 
if __name__ == '__main__': 
    app = ApplicationBuilder().token(TOKEN).build() 
    app.add_handler(CommandHandler("start", start)) 
    app.add_handler(MessageHandler(filters.PHOTO, nft_handler)) 
    print("BOT ONLINE - GitHub Link bereit."); app.run_polling() 
