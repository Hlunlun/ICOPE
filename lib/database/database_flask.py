from flask import Flask, request, jsonify
import json
import requests
from bs4 import BeautifulSoup
from jsonmerge import Merger
import random
import time

from database_info import find_user

app = Flask(__name__)


# get data from flask
@app.route('/check_user', methods = ['POST'])
def get_data():
    if request.method == 'POST':
        user_id=request.json['id']
        pwd = request.json['pwd']
        
        user = find_user({'pwd' : pwd, 'id': user_id})
        return  jsonify({'exist' : user!=None})



if __name__ == "__main__":       
    app.debug = False
    app.run(host="0.0.0.0", port = 30011,debug=True)