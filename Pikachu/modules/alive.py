from telethon import events, Button, custom
import re, os
from Pikachu.events import register
from Pikachu import telethn as tbot
from Pikachu import telethn as tgbot
PHOTO = "https://telegra.ph/file/3fa63f2c7b8f1930298b4.jpg"
@register(pattern=("/alive"))
async def awake(event):
  PIKACHU = event.sender.first_name
  PIKACHU = "**♡ I,m Pikachu** \n\n"
  PIKACHU += "**♡ I'm Working Properly**\n\n"
  PIKACHU += "**♡ pikachu : 2.0 LATEST**\n\n"
  PIKACHU += "**♡ My Master :** [HEMANTH](t.me/HEMANTHGAMING1K)\n\n"
  PIKACHU += "**♡ Telethon Version : 1.23.0**\n\n"
  BUTTON = [[Button.url("𝙎𝙐𝙋𝙋𝙊𝙍𝙏", "https://t.me/hgvideobotsupportgroup"), Button.url("𝙐𝙋𝘿𝘼𝙏𝙀", "https://t.me/hgbotsupportchannel")]]
  await tbot.send_file(event.chat_id, PHOTO, caption=PIKACHU,  buttons=BUTTON)


__mod_name__ = "Alive⚜️"
