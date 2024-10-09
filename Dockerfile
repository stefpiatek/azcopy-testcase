FROM ubuntu:latest

# Set environment variables for proxy
ARG HTTP_PROXY
ENV http_proxy=$HTTP_PROXY
ENV https_proxy=$HTTP_PROXY

# Install dependencies and azcopy
RUN apt-get update && \
    apt-get install -y wget && \
    wget -O azcopy.tar.gz https://aka.ms/downloadazcopy-v10-linux && \
    tar -xvf azcopy.tar.gz && \
    mv azcopy_linux_amd64_*/azcopy /usr/bin/ && \
    rm -rf azcopy_linux_amd64_* azcopy.tar.gz && \
    apt-get clean

# Verify installation
RUN azcopy --version

# Copy over script
COPY --chmod=0755 copy.sh /app/copy.sh

# Set the entrypoint to azcopy
ENTRYPOINT ["/bin/bash"]