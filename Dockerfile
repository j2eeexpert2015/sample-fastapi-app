# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install debugpy

# Expose port 8000 for the FastAPI app
EXPOSE 8000
# Expose the debug port (5678)
EXPOSE 5678

# Run the FastAPI application
#CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
# Start the app with debugpy
CMD ["python", "-m", "debugpy", "--listen", "0.0.0.0:5678", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
