FROM python:3.10

WORKDIR /app

# Install Tesseract OCR
RUN apt-get update && apt-get install -y tesseract-ocr

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Start Flask app with Waitress
CMD ["waitress-serve", "--port=7860", "app:app"]
