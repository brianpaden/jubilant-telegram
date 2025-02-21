# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Update apt and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    wget \
    apt-transport-https \
    gnupg \
    git \
    && \
    apt-get clean

# Download and install the Microsoft GPG key
RUN wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb

# Install PowerShell
RUN apt-get update && \
    apt-get install -y powershell && \
    apt-get clean

# Clone ScanMedia script
RUN git clone --depth 1 https://gist.github.com/129be27da7d735d7c75192ec1aa96c65.git

# Set PowerShell as the default shell
CMD ["pwsh"]
