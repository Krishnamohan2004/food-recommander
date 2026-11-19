FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py fruit_nutrition.csv ./

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0", "--server.port=8501"]FROM python:3.11-slim\n\n# Set working directory\nWORKDIR /app\n\n# Install system dependencies (if any)\nRUN apt-get update && apt-get install -y --no-install-recommends \\
    build-essential \\
    gcc && \\
    rm -rf /var/lib/apt/lists/*\n\n# Copy requirements and install Python packages\nCOPY requirements.txt ./\nRUN pip install --no-cache-dir -r requirements.txt\n\n# Copy application source code\nCOPY . /app\n\n# Expose Streamlit default port\nEXPOSE 8501\n\n# Set non-root user\nRUN useradd -m appuser && chown -R appuser /app\nUSER appuser\n\n# Default command to run the Streamlit app\nCMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
