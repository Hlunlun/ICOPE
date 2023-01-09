from flask import Flask, request, jsonify
import json
import requests
from bs4 import BeautifulSoup
from jsonmerge import Merger
import random
import time

from database_info import find_user_login,find_user_by_id

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

# @app.route('add_new_user',methods = ['POST'])
# def add_new_user():
#     if request.method == 'POST':
#         user_id = request.json['id']

#         user_name = request.json['name']

#         user_disease = request.json['disease']

#         return jsonify({'success' : True})



if __name__ == "__main__":       
    app.debug = False
    app.run(host="0.0.0.0", port = 30011,debug=True)