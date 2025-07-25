from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "MyLiveApp Phase 0 Complete!"
