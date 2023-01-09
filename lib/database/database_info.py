import os
from dotenv import load_dotenv
from pymongo import MongoClient
import datetime
load_dotenv()


def get_current_time():
    current_time = datetime.datetime.now()
    time = str(current_time.year) + '/' + str(current_time.month) + '/' + str(current_time.day) + ' ' + str(current_time.hour) + ':' + str(current_time.minute)
    return time

def get_current_date():
    current_time = datetime.datetime.now()
    time = str(current_time.year) + '/' + str(current_time.month) + '/' + str(current_time.day) 
    return time

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
        'time' : get_current_time(),
        'name':info['name'],
        'password' : info['pwd'],
        'id' : info['id'],
        'age' : '',
        'gender' : '',
        'daily_record' : [],
        'health_record' :[],
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


def update_user_basic_info(info):
    db = get_database()
    collection = db['users']

    collection.update_one(
        {'id': {'$eq' : info['id']}},
        {'$set':{
            'age' : info['age'],
            'gender' : info['gender'],
            'time' : get_current_time(),
        }}
    )

def update_daily_info(info):
    db = get_database()
    collection = db['users']

    user = find_user_by_id(info['id'])
        
    user['daily_record'].append({
        'bloodPressure' : info['bloodPressure'],
        ' weight' :  info['weight'],
        'height' : info['height'],   
        'time' : get_current_time()
    })

    collection.update_one(
        {'id': {'$eq' : info['id']}},
        {'$set':user}
    )

def update_health_record_info(info):
    db = get_database()
    collection = db['users']
    
    user = find_user_by_id(info['id'])

    health_record = user['health_record']

    exist = 0

    for i in range(len(health_record)):
        if health_record[i].date == get_current_date():
            health_record[i].cognitive = info['cognitive']
            health_record[i].nutrition = info['nutrition']
            health_record[i].vision = info['vision']
            health_record[i].mood = info['mood']
            health_record[i].listening = info['listening']
            exist = 1

    if exist == 1 :
        user['health_record'] = health_record
        collection.update_one(                
            {'id': {'$eq' : info['id']}},
            {'$set':user}
        )
    else:
        collection.insert_one({
            
        })


    


    





if __name__ == "__main__": 
   db = get_database()
   add_new_user({
    'name' : 'jj',
    'pwd':'jj',
    'id' : '0',
    'health_record' : []

   })
   print(db)


