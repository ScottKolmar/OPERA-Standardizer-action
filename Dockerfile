# Import Docker image
FROM ubuntu:20.04

# Put source code in docker container
WORKDIR /app
COPY . /app

# Update apt
RUN apt-get update

# Install java runtime
RUN { echo "Y"; echo "US"; echo "Eastern"; } | apt-get install default-jre

# Install Curl
RUN echo "Y" | apt install curl

# Install unzip
RUN apt install unzip

# Install libxmu6
RUN echo "Y" | apt install libxmu6

# Download OPERA
RUN curl -L -O https://github.com/kmansouri/OPERA/releases/download/v2.7-beta2/OPERA2.7_CL_mcr.tar.gz

# Decompress OPERA
RUN tar -xzvf OPERA2.7_CL_mcr.tar.gz

# Install OPERA
RUN ./OPERA2_CL_mcr/OPERA2.7_mcr_Installer.install -mode silent -agreeToLicense yes

# Install python
RUN echo "Y" | apt install python3.8

# Install distutils
RUN echo "y" | apt install python3.8-distutils

# Install pip
RUN echo "Y" | apt install python3-pip

# Install dependencies
RUN /usr/bin/pip3 install -r ./requirements.txt

# Expose port
EXPOSE 5000
