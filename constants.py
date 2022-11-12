from dotenv import load_dotenv
import os

load_dotenv()

# get environment variable BOT_TOKEN
BOT_TOKEN = os.getenv('BOT_TOKEN', '')
if BOT_TOKEN == '':
    # raise exception
    raise Exception('BOT_TOKEN not found in .env file')
