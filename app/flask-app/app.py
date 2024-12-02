# from flask import Flask, request, jsonify, render_template
# from flask_cors import CORS
# import requests

# app = Flask(__name__)
# CORS(app)  # Enable CORS

# RASA_URL = 'https://krishisarthiai-production.up.railway.app/webhook'

# @app.route("/")
# def home():
#     return render_template("index.html")

# @app.route('/webhook', methods=['POST'])
# def webhook():
#     user_message = request.json.get('message')
#     if not user_message:
#         return jsonify({'error': 'No message provided'}), 400

#     # Send message to Rasa
#     response = requests.post(RASA_URL, json={'message': user_message})
#     rasa_responses = response.json()

#     return jsonify(rasa_responses)

# if __name__ == '__main__':
#     app.run(port=5000, debug=True)



from flask import Flask, request, jsonify, render_template
from flask_cors import CORS
import requests

app = Flask(__name__)
CORS(app)  # Enable CORS for cross-origin requests

RASA_URL = 'https://krishisarthiai-production.up.railway.app/webhook'  # Ensure webhook endpoint is correctly set

@app.route("/")
def home():
    return render_template("index.html")  # Make sure your frontend is working correctly

@app.route('/webhook', methods=['POST'])
def webhook():
    user_message = request.json.get('message')  # Get the message from the frontend
    if not user_message:
        return jsonify({'error': 'No message provided'}), 400  # Handle the case when the message is missing

    try:
        # Send the user message to Rasa
        response = requests.post(RASA_URL, json={'message': user_message})
        
        # Check if the request to Rasa was successful
        if response.status_code != 200:
            return jsonify({'error': 'Failed to communicate with Rasa', 'details': response.text}), 502

        rasa_responses = response.json()  # Get the JSON response from Rasa

        # Return the response from Rasa to the frontend
        return jsonify(rasa_responses)
    except requests.exceptions.RequestException as e:
        # Handle any request-related exceptions (e.g., network issues)
        return jsonify({'error': 'Error communicating with Rasa', 'details': str(e)}), 500

if __name__ == '__main__':
    app.run(port=5000, debug=True)
