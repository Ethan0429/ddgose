import constants as c
import discord
from discord.ext import commands


def start():

    # create bot with full intents
    bot = commands.Bot(command_prefix='!', intents=discord.Intents.all())

    # startup message
    @bot.event
    async def on_ready():
        print('____________________________________________________________')
        print('Ready to stonk!')

    @bot.command()
    async def ping(ctx):
        await ctx.send('pong')

    # run bot
    bot.run(c.BOT_TOKEN)


if __name__ == "__main__":
    start()
