from flask import Flask, request, jsonify
from flask_cors import CORS
from transformers import pipeline

# Load the pre-trained transformer model for text classification
classifier = pipeline('text-classification', model='distilbert-base-uncased-finetuned-sst-2-english')

# Create the Flask application
app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

@app.route('/analyze', methods=['POST'])
def analyze():
    data = request.get_json()
    responses = data['responses']
    combined_text = ' '.join(responses)  # Combine all responses into a single text
    result = classifier(combined_text)  # Use the transformer model to classify the text
    return jsonify(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
