FROM tensorflow/tensorflow:2.9.1
COPY requirements.txt requirements.txt
COPY api.py api.py
COPY download.py download.py
RUN pip install -r requirements.txt
RUN python3 download.py
CMD uvicorn api:app --host 0.0.0.0 --port $PORT