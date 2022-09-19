from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from transformers import pipeline
import numpy as np

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins
    allow_credentials=True,
    allow_methods=["*"],  # Allows all methods
    allow_headers=["*"],  # Allows all headers
)
app.state.classifier = pipeline("text-classification",model='bhadresh-savani/bert-base-uncased-emotion', return_all_scores=True)

@app.get("/predict")
def predict(text: str):  
    classifier = app.state.classifier
    prediction = classifier(text)
    top_pred = [pred for pred in prediction[0]][np.argmax([pred['score'] for pred in prediction[0]])]
    return top_pred

@app.get("/")
def root():
    return dict(greeting="Hello")
