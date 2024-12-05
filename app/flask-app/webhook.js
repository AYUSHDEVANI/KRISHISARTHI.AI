// script.js
const apiUrl = 'http://localhost:5000/webhooks/rest/webhook'; // Update this to match your Rasa endpoint

document.getElementById('send-button').addEventListener('click', sendMessage);
document.getElementById('user-input').addEventListener('keypress', (e) => {
    if (e.key === 'Enter') {
        sendMessage();
    }
});

function sendMessage() {
    const userInput = document.getElementById('user-input').value;
    if (userInput.trim() === '') return;

    // Display user message
    appendMessage('You', userInput);

    // Send user message to Rasa
    fetch(apiUrl, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ sender: 'user', message: userInput })
    })
    .then(response => response.json())
    .then(data => {
        // Display Rasa response
        data.forEach(message => {
            appendMessage('Bot', message.text);
        });
    })
    .catch(error => console.error('Error:', error));

    // Clear input field
    document.getElementById('user-input').value = '';
}

function appendMessage(sender, text) {
    const messageElement = document.createElement('div');
    messageElement.textContent = `${sender}: ${text}`;
    document.getElementById('chatbox-messages').appendChild(messageElement);
    document.getElementById('chatbox-messages').scrollTop = document.getElementById('chatbox-messages').scrollHeight;
}
