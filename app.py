from flask import Flask, request, abort, jsonify
from pymongo import MongoClient
import requests
import os
from bson.json_util import dumps
import json


app = Flask(__name__)

uri = os.environ['MONGO_DB_URI']
client = MongoClient(uri)
db = client['ecopost']
posts = db['posts']
users = db['users']

@app.route('/')
def home():
    return "<h1>Hello</h1>"

@app.route('/get_posts', methods=['GET'])
def get_posts():
    output = []
    for x in posts.find({},{ "_id": 0, "image": 1}):
        print(x)
        output.append(x)
    return json.dumps(output)

@app.route('/upload_image', methods=['POST'])
def upload_image():
    response3 = request.form
    print("response3", response3.get('image'))
    img = response3.get('image')
    post = {
        'image': img
    }
    result = posts.insert_one(post)
    return "success"


if __name__ == '__main__':
    app.run(debug=True)
