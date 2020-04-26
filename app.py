from flask import Flask, request, abort, jsonify
from pymongo import MongoClient
import requests
import os
from bson.json_util import dumps
import json
import uuid
import random

app = Flask(__name__)

uri = os.environ['MONGO_DB_URI']
client = MongoClient(uri)
db = client['ecopost']
posts = db['posts']
users = db['users']
challenges = db['challenges']
comments = db['comments']
@app.route('/')
def home():
    return "<h1>Hello</h1>"

@app.route('/get_posts', methods=['GET'])
def get_posts():
    output = []
    dict = {}
    for x in posts.find({},{ "_id": 0, "post_id": 1, "handle": 1, "likes":1, "hashtag":1, "image":1, "profile_picture":1, "name": 1, "location":1, "info":1, "lat_lng":1, "timestamp":1, "challenge":1}):
        print(x)
        output.append(x)
    dict['data'] = output
    return json.dumps(dict)

@app.route('/send_post', methods=['POST'])
def send_post():
    response = request.form
    id = uuid.uuid4()
    post_id = str(id)

    # handle = response.get('handle')
    name = response.get('name')
    location = response.get('location')
    image = response.get('image')
    hashtag = response.get('hashtag')
    info = response.get('info')
    profile_picture = response.get('profile_picture')
    lat_lng = response.get('lat_lng')
    timestamp = response.get('timestamp')
    challenge = response.get('challenge')
    # lat_lng_arr = lat_lng.split(',')
    # lat_lng_arr[0] += (random.randint(1,50) * 0.0001)
    # lat_lng_arr[1] += (random.randint(1,50) * 0.0001)
    # lat_lng = ",".join(lat_lng_arr)

    post = {
        'post_id': post_id,
        'handle': "@dylantheriot",
        'name': name,
        'location': location,
        'image': image,
        'likes': random.randint(1,2),
        'hashtag': hashtag,
        'info': info,
        'profile_picture': profile_picture,
        'lat_lng': lat_lng,
        'timestamp': "a minute ago",
        'challenge': challenge
    }

    posts.insert_one(post)
    challenges_arr = challenge.split(',')
    for i in challenges_arr:
        challenges.insert_one({i: "@dylantheriot"})
    return "success"

@app.route('/get_personal_challenges_page', methods=['GET'])
def get_personal_challenges_page():
    response = request.form
    handle = response['handle']
    dict = {}
    challenged_by = []
    dict['challenged_by'] = challenged_by # needs to include status

    query = { "handle": handle }
    post = posts.find(myquery)
    # This will be received from the handle
    dict['handle'] = post['handle']
    dict['profile_picture'] = post['profile_picture']
    dict['name'] = post['name']
    dict['challenged'] = post['challenge']

@app.route('/get_post_comments', methods=['GET'])
def get_post_comments():
    response = request.form

@app.route('/send_post_comment', methods=['POST'])
def send_post_comments():
    response = request.form
    post_id = response.get('post_id')
    handle = response.get('handle')
    profile_picture = response.get('profile_picture')
    comment = response.get('comment')
    timestamp = response.get('timestamp')

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
