# from flask import Flask, request, jsonify, render_template
# import requests
# from flask_cors import CORS

# app = Flask(__name__)
# CORS(app)

# @app.route('/')
# def index():
#     return render_template("index.html")

# @app.route('/webhooks/rest/webhook', methods=['POST'])
# def chat():
#     data = request.json
#     print("Received data:", data)  # Debugging line
#     message = data.get('message')
#     sender = data.get('sender')
#     # print(message)
#     # rasa_url = 'http://localhost:5005/webhooks/rest/webhook'  # Ensure this matches your Rasa server URL
#     rasa_url = 'https://vigilant-halibut-jv4gpqwwgrwfwqx-5005.app.github.dev'  # Ensure this matches your Rasa server URL
#     try:
#         response = requests.post(rasa_url, json={'message': message})
#         print(response)
#         # response.json()
#         # response.raise_for_status()
#     except requests.exceptions.RequestException as e:
#         print("Error communicating with Rasa:", str(e))  # Debugging line
#         return jsonify({"error": str(e)}), 500

#     print("Rasa response:", response.json())  # Debugging line
#     return jsonify(response.json())

# if __name__ == '__main__':
#     app.run(debug=True, port=5000)  # Define the port here



from flask import Flask, request, jsonify, render_template
import requests
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/webhooks/rest/webhook', methods=['POST'])
def chat():
    data = request.json
    print("Received data:", data)  # Debugging line
    
    # Extract message and sender
    message = data.get('message')
    sender = data.get('sender')
    
    # Rasa server URL
    rasa_url = 'https://vigilant-halibut-jv4gpqwwgrwfwqx-5005.app.github.dev/webhooks/rest/webhook'
    
    try:
        # Make a POST request to the Rasa server
        response = requests.post(rasa_url, json={'sender': sender, 'message': message})
        response.raise_for_status()  # Raise an error for non-200 responses
    except requests.exceptions.RequestException as e:
        print("Error communicating with Rasa:", str(e))  # Debugging line
        return jsonify({"error": str(e)}), 500

    print("Rasa response:", response.json())  # Debugging line
    return jsonify(response.json())  # Forward Rasa's response to the frontend

if __name__ == '__main__':
    app.run(debug=True, port=5000)  # Define the port here
