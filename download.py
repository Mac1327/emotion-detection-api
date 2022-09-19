from transformers import pipeline
pipeline("text-classification",model='bhadresh-savani/bert-base-uncased-emotion', return_all_scores=True)
print('done!')