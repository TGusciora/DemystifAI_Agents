# Base image - typically Python for Python dev environments
FROM python:3.12.7-bookworm

# Set the working directory
WORKDIR /app

# Install system dependencies including Rust
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    pkg-config \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
    && . $HOME/.cargo/env

# Add cargo to PATH
ENV PATH="/root/.cargo/env:${PATH}"
ENV PATH="/root/.cargo/bin:${PATH}"

# Install dependencies and source
RUN pip install --upgrade pip
COPY ./requirements.txt ./
COPY ./setup.py ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy src package codes to the container
COPY ./src ./src

# Common pitfalls:
# 1) Filename has to be Dockerfile exactly. Otherwise it won't work.
# 2) You must copy ./setup.py to install the src package