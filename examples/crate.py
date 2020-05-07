#!/usr/bin/python3
from bottle import route, run, template, view, static_file, request, get, post, response, abort
import json
from functools import partial

#Routes
@route('/')
def index():
    return templates('index', dict(usersData=getUsers()))

@route('/profile/<user>/')
def profile(user):
    return templates('index', dict(usersData=[getUser(user)]))

# Functions
def getUsers():
    with open('./data/example.json', 'r') as f:
        users = json.loads(f.read())
    return users

def getUser(name):
    with open('./data/example.json', 'r') as f:
        users = json.loads(f.read())
    for user in users:
        if name in user['name']:
            return user
    return abort(403, 'User Not found')

# Static Route
@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='./static/')


# API
@get('/api/<endpoint>/')
@get('/api/<endpoint>/<parameter>/')
@post('/api/<endpoint>/')
@post('/api/<endpoint>/<parameter>/')
def getEndpointChooser(endpoint, parameter=None):
    response.headers['Content-Type'] = 'application/json'
    response.headers['Cache-Control'] = 'no-cache'
    methods = {
        "POST":[],
        "GET": ["getUsers", "getUser"],
        "PUT": [],
        "DELETE": [],
        "PATCH": []
    }
    if endpoint in methods[request.method]:
        if parameter:
            return json.dumps(globals()[endpoint](parameter), indent=2)
        else:
            return json.dumps(globals()[endpoint](), indent=2)
    else:
        return abort(403, "That request is not permitted")


templates = partial(template, request=request)
if __name__ == "__main__":
    run(host='localhost', port=8080, reloader=True, debug=True)