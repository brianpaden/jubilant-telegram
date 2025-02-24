# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Update apt and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    wget \
    gnupg \
    ffmpeg \
    && \
    apt-get clean

# Download the PowerShell package file
RUN wget https://github.com/PowerShell/PowerShell/releases/download/v7.5.0/powershell_7.5.0-1.deb_amd64.deb -P tmp

###################################
# Install the PowerShell package
RUN dpkg -i /tmp/powershell_7.5.0-1.deb_amd64.deb

# Resolve missing dependencies and finish the install (if necessary)
RUN apt-get install -f

# Delete the downloaded package file
RUN rm /tmp/powershell_7.5.0-1.deb_amd64.deb

# Pull in ScanMedia script
COPY scanmedia/ /app/

# Set PowerShell as the default shell
CMD ["pwsh"]
