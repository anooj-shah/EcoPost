from flask import Flask, request, abort, jsonify
from pymongo import MongoClient
import requests
import os
from bson.json_util import dumps
import json
import uuid

app = Flask(__name__)

uri = os.environ['MONGO_DB_URI']
client = MongoClient(uri)
db = client['ecopost']
posts = db['posts']
users = db['users']
comments = db['comments']
@app.route('/')
def home():
    return "<h1>Hello</h1>"

@app.route('/get_posts', methods=['GET'])
def get_posts():
    output = []
    dict = {}
    for x in posts.find({},{ "_id": 0, "post_id": 1, "handle": 1, "image":1, "profile_picture":1, "name": 1, "location":1, "info":1, "lat_lng":1, "timestamp":1, "challenge":1}):
        print(x)
        output.append(x)
    dict['data'] = output
    return json.dumps(dict)

@app.route('/send_post', methods=['POST'])
def send_post():
    response = request.form
    id = uuid.uuid4()
    post_id = str(id)

    # handle = response['handle']
    # name = response['name']
    # location = response['location']
    # image = response['image']
    # info = response['info']
    # profile_picture = response['profile_picture']
    # lat_lng = response['lat_lng'] # array
    # timestamp = response['timestamp']
    # challenge = response['challenge'] # given as string
    # challenge = challenge.split(',')

    handle = response.get('handle')
    name = response.get('name')
    location = response.get('location')
    image = response.get('image')
    info = response.get('info')
    profile_picture = response.get('profile_picture')
    lat_lng = response.get('lat_lng') # array
    # lat_lng = lat_lng.split(',')
    timestamp = response.get('timestamp')
    challenge = response.get('challenge') # given as string
    # challenge = challenge.split(',')

    post = {
        'post_id': post_id,
        'handle': handle,
        'name': name,
        'location': location,
        'image': image,
        'info': info,
        'profile_picture': profile_picture,
        'lat_lng': lat_lng,
        'timestamp': timestamp,
        'challenge': challenge
    }
    posts.insert_one(post)
    return "success"
@app.route('/get_post_comments', methods=['GET'])
def get_post_comments():
    response = dict(request.form)

@app.route('/send_post_comment', methods=['POST'])
def send_post_comments():
    response = dict(request.form)
    post_id = response['post_id']
    handle = response['handle']
    profile_picture = response['profile_picture']
    comment = response['comment']
    timestamp = response['timestamp']

    comment = {

    }

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
