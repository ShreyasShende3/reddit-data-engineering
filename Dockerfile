FROM apache/airflow:2.7.1-python3.10

# Copy the requirements.txt to the image
COPY requirements.txt /opt/airflow/

# Switch to root to install necessary packages
USER root

# Update and install git, gcc, and python3-dev
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    python3-dev

# Switch back to airflow user to ensure the container runs as a non-root user
USER airflow

# Install the Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r /opt/airflow/requirements.txt
