from flask import Flask, request, abort, jsonify
from pymongo import MongoClient
import requests
import os

app = Flask(__name__)

uri = os.environ['MONGO_DB_URI']
client = MongoClient(uri)
db = client['ecopost']
posts = db['posts']
users = db['users']

@app.route('/')
def home():
    return "<h1>Hello</h1>"

@app.route('/get_posts', methods=['POST'])
def get_posts():
    response = request.get_json()
    username = response['username']
    meetings_arr = []
    user = {
        'username': username,
        'subscriptions': meetings_arr,
    }
    result = users.insert_one(user)
    return "success"

@app.route('/upload_image', methods=['POST'])
def upload_image():
    response = request.get_json
    print("RESPONSE", response['image'])
    return "success"
    # meetings_arr = []
    # user = {
    #     'username': username,
    #     'subscriptions': meetings_arr,
    # }
    # result = users.insert_one(user)
    # return "success"
# @app.route('/subscribe', methods=['POST'])
# def subscribe():
#     response = request.get_json()
#     username = response['username']
#     zoom_id = response['zoom_id']
#     print(meetings.find_one({"zoom_id":zoom_id}))
#     return "success"
#
# @app.route('/list_meetings1')
# def list_meetings1():
#     meetings_arr = list(meetings.find())
#     return jsonify(results = meetings_arr)

if __name__ == '__main__':
    app.run(debug=True)
