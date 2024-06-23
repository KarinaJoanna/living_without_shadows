from flask import Flask, request, jsonify
from flask_cors import CORS
import pandas as pd
import re
import nltk
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.metrics import classification_report
from transformers import pipeline

# Initialize NLTK (download resources if necessary)
nltk.download('stopwords')
nltk.download('punkt')

# Load and preprocess the dataset (replace 'mental_health.csv' with your own CSV file)
df = pd.read_csv('mental_health.csv')

def preprocess(text):
    text = text.lower()  # Convert to lowercase
    text = re.sub(r'\W', ' ', text)  # Remove special characters
    tokens = word_tokenize(text)  # Tokenization
    tokens = [word for word in tokens if word not in stopwords.words('english')]  # Remove stopwords
    stemmer = PorterStemmer()
    tokens = [stemmer.stem(word) for word in tokens]  # Stemming
    return ' '.join(tokens)

df['processed_text'] = df['text'].apply(preprocess)

# Vectorize text data
vectorizer = TfidfVectorizer()
X = vectorizer.fit_transform(df['processed_text'])
y = df['label']  # Assuming there is a 'label' column for classification

# Split data into training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train an SVM classifier
svm = SVC(kernel='linear')
svm.fit(X_train, y_train)

# Evaluate the classifier
y_pred = svm.predict(X_test)
print(classification_report(y_test, y_pred))

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
