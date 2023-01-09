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

def add_new_user(info):
    db = get_database()

    collection = db['users']

    data = {        
        'name':info['name'],
        'password' : info['pwd'],
        'id' : info['id'],
        'health_record' : [],
    }
    collection.insert_one(data)

def find_user_login(info):
    db = get_database()
    collection = db['users']

    user = collection.find_one( {
        'id': {'$eq' : info['id']},
        'password' : {'$eq' : info['pwd']}        
    })

    return user

def find_user_by_id(user_id):
    db = get_database()
    collection = db['users']
    user = collection.find_one({
        'id' : {'$eq' : user_id}
    })
    return user

if __name__ == "__main__": 
   db = get_database()
   add_new_user({
    'name' : 'jj',
    'pwd':'jj',
    'id' : '0',
    'health_record' : []

   })
   print(db)


