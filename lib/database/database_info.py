import os
from dotenv import load_dotenv
from pymongo import MongoClient
import datetime
load_dotenv()

def get_database():    
    connection_string = os.getenv("CONNECTION_STRING", None)
    client = MongoClient(connection_string)
    db = client.icope
    return db
    return client.icope

def add_user_info(info):
    db = get_database()

    collection = db['users']

    data = {        
        'name':info['name'],
        'password' : info['pwd'],
        'id' : info['id']
    }
    collection.insert_one(data)

def add_user_heath_info(info):
    db = get_database()

    collection = db['health']

    data={
        'name' : info['name'],
        'id' : info['id'],
        'height' : info['height'],
        'weight' : info['weight'],
        'blood pressure' : info['blood_pressure']
    }

    collection.insert_one(data)

def find_user(info):
    db = get_database()
    collection = db['users']

    user = collection.find_one( {
        'id': {'$eq' : info['id']},
        'password' : {'$eq' : info['pwd']}        
    })

    return user
    

if __name__ == "__main__": 
   db = get_database()
   add_user_info({
    'name' : 'jj',
    'pwd':'jj',
    'id' : '0',

   })
   print(db)


