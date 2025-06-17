# Use official Python image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy app code
COPY app.py .

# Install dependencies
RUN pip install flask

# Run the app
CMD ["python", "app.py"]
