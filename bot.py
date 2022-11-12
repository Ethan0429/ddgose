# generate discordpy boilerplate

import constants as c
import discord
from discord.ext import commands


# create bot with full intents
bot = commands.Bot(command_prefix='!', intents=discord.Intents.all())

# startup message


@bot.event
async def on_ready():
    print('Ready to stonk!')

# run bot
bot.run(c.BOT_TOKEN)
