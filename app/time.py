# pip install flask-rest-jsonapi flask-sqlalchemy flask-cors
# https://www.linode.com/docs/web-servers/nginx/use-nginx-reverse-proxy/
#pip install -U flask-cors

from flask import Flask
from flask_cors import CORS
import requests
import json

app = Flask(__name__)
CORS(app)

@app.route('/')
def example(city):   
   return response.json("{hello: there}")


@app.route('/time/<city>')
def time(city):
   geocde = requests.get("https://maps.googleapis.com/maps/api/geocode/json?address=%s&key=AIzaSyC4MqO8xBvSaLb26ozB0NwoJKTmeS7sBU8" % city)
   y = json.loads(geocde.content)
   # print(y['results'])
   # print(y['results'])
   return geocde.json()

@app.route('/timezone/<latlong>')
def timezone(latlong):
   tz = requests.get("https://maps.googleapis.com/maps/api/timezone/json?location=%s&timestamp=1374868635&sensor=false&key=AIzaSyC4MqO8xBvSaLb26ozB0NwoJKTmeS7sBU8" % latlong)
   y = json.loads(tz.content)
   # print(y['results'])
   # print(y['results'])
   #39.1031182,-84.5120196
   return tz.json()

if __name__ == '__main__':
    app.run(port=int("5000"))


