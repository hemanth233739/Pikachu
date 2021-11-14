# Voics Chatbot Module Credits Pranav Ajay 🐰Github = Red-Aura 🐹 Telegram= @madepranav
# @lyciachatbot support Now
import os
import aiofiles
import aiohttp
from random import randint
from pyrogram import filters
from Pikachu import pbot as Pikachu


async def fetch(url):
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as resp:
            try:
                data = await resp.json()
            except:
                data = await resp.text()
    return data


async def ai_Pikachu(url):
    ai_name = "Pikachu.mp3"
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as resp:
            if resp.status == 200:
                f = await aiofiles.open(ai_name, mode="wb")
                await f.write(await resp.read())
                await f.close()
    return ai_name


@Pikachu.on_message(filters.command("voice"))
async def Pikachu(_, message):
    if len(message.command) < 2:
        await message.reply_text("Pikachu AI Voice Chatbot")
        return
    text = message.text.split(None, 1)[1]
    Asuna = text.replace(" ", "%20")
    m = await message.reply_text("Pikachu Is Best...")
    try:
        L = await fetch(
            f"https://api.affiliateplus.xyz/api/chatbot?message={lycia}&botname=@Pikachu_X_bot&ownername=@Murat_30_God&user=1"
        )
        chatbot = L["message"]
        VoiceAi = f"https://lyciavoice.herokuapp.com/lycia?text={chatbot}&lang=hi"
        name = "pikachu"
    except Exception as e:
        await m.edit(str(e))
        return
    await m.edit("Made By @HEMANTHGAMING1K...")
    PikachuVoice = await ai_Pikachu(VoiceAi)
    await m.edit("Repyping...")
    await message.reply_audio(audio=PikachuVoice, title=chatbot, performer=name)
    os.remove(AsunaVoice)
    await m.delete()
