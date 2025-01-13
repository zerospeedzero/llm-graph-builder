# Stage 1: Builder
FROM python:3.10-slim as builder

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        libmagic1 \
        libgl1-mesa-glx \
        cmake \
        poppler-utils \
        tesseract-ocr && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . /app

# Stage 2: Runtime
FROM python:3.10-slim

# Set working directory
WORKDIR /code

# Install runtime dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libmagic1 \
        libgl1-mesa-glx \
        poppler-utils \
        tesseract-ocr && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy Python dependencies from the builder stage
COPY --from=builder /usr/local/lib/python3.10 /usr/local/lib/python3.10
COPY --from=builder /usr/local/bin /usr/local/bin

# Copy application code
COPY --from=builder /app /code

# Set environment variables
ENV PORT=8000
ENV WORKERS=2
ENV THREADS=8

# Expose the application port
EXPOSE 8000

# Command to run the application
CMD ["gunicorn", "score:app", "--workers", "2", "--threads", "8", "--worker-class", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:8000", "--timeout", "300"]
