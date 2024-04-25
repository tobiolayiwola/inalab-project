"""
A simple Flask app to greet visitors.
"""
from flask import Flask
from flask import jsonify
import os

app = Flask(__name__)

# Fetch the greeting from the environment variable or use "Hello, World!" as default
GREETING = os.getenv('GREETING', 'Hello, World!')

"""
Greetings
"""
@app.route("/")
def hello():
    # Return the greeting
    return GREETING

"""
Return sample JSON data
"""
@app.route("/data")
def data():
    data = {"samples":[{"name":"one","id":"7692c3ad3540bb803c020b3aee66cd8887123234ea0c6e7143c0add73ff431ed"},{"name":"two","id":"3fc4ccfe745870e2c0d99f71f30ff0656c8dedd41cc1d7d3d376b0dbe685e2f3"},{"name":"three","id":"8b5b9db0c13db24256c829aa364aa90c6d2eba318b9232a4ab9313b954d3555f"}]}
    return jsonify(data)

"""
Runtime
"""
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=True, host='0.0.0.0', port=port)
