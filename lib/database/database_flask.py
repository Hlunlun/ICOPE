from flask import Flask, request, jsonify
import json
import requests
from bs4 import BeautifulSoup
from jsonmerge import Merger
import random
import time

from database_info import find_user_login,find_user_by_id,add_new_user,update_user_basic_info,update_daily_info,update_health_record_info


app = Flask(__name__)


@app.route('/check_user', methods = ['POST'])
def check_user():
    if request.method == 'POST':
        user_id=request.json['id']
        pwd = request.json['pwd']
        
        user = find_user_login({'pwd' : pwd, 'id': user_id})
        return  jsonify({'exist' : user!=None})


@app.route('/find_user_name', methods = ['POST'])
def find_user_name():
    if request.method == 'POST':
        user_id=request.json['id']
        
        user = find_user_by_id(user_id)
        return  jsonify({'success' : user!=None ,'name' : user['name']})

@app.route('/add_new_user',methods = ['POST'])
def add_user():
    if request.method == 'POST':
        user_id = request.json['id']
        user_name = request.json['name']
        user_pwd = request.json['pwd']

        add_new_user({
            'name' : user_name,
            'id' : user_id,
            'pwd' : user_pwd,
        })

        return jsonify({'success' : True})


@app.route('/find_user_info',methods=['POST'])
def find_user_info():
    if request.method == 'POST':
        user_id = request.json['id']

        user = find_user_by_id(user_id)

        return jsonify({
            'success' : user!=None,
            'user' : {
                'id' : user['id'],
                'name' : user['name'],
                'age' : user['age'],
                'gender' : user['gender'],
                'health_record' : user['health_record'],
                'daily_record' : user['daily_record']
            }
        })



@app.route('/update_user_basic',methods=['POST'])
def update_user_basic():
    if request.method == 'POST':
        user_id = request.json['id']
        user_gender = request.json['gender']
        user_age = request.json['age']
        update_user_basic_info({
            'id':user_id,
            'age' :int(user_age),
            'gender' : int(user_gender)
        })

        return jsonify({'success':True})

@app.route('/update_daily_record',methods=['POST'])
def update_daily_record():
    if request.method == 'POST':
        user_id = request.json['id']
        user_bloodPressure = request.json['bloodPressure']
        user_weight = request.json['weight']
        user_height = request.json['height']

        update_daily_info({
            'id': user_id,
            'bloodPressure':int(user_bloodPressure),
            'weight' :  int(user_weight),
            'height' : int(user_height),            
        })

        return jsonify({'success':True})


@app.route('/update_health_record',methods=['POST'])
def update_health_record():
    if request.method == 'POST':
        
        update_health_record_info({
            'id': request.json['id'],
            'cognitive':request.json['cognitive'],
            'nutrition': request.json['nutrition'],
            'vision': request.json['vision'],
            'mood': request.json['mood'],
            'listening':request.json['listening'],
            'times': request.json['times'],
            'status': request.json['status'],       
        })

        return jsonify({'success':True})


if __name__ == "__main__":       
    app.debug = False
    app.run(host="0.0.0.0", port = 30011,debug=True)