FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y build-essential python3-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8501
CMD ["streamlit", "run", "main.py"]
