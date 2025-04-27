FROM kalilinux/kali-rolling

# Install base tools
RUN apt update && apt install -y \
    wget curl gnupg git net-tools dnsutils iputils-ping \
    gobuster dirbuster seclists \
    nmap jq vim \
    python3 python3-pip python3-venv pipx \
    kubectl \
    apt-transport-https ca-certificates \
    && apt clean

# Install gcloud cli and add to path
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz \
    && tar -xf google-cloud-cli-linux-x86_64.tar.gz \
    && ./google-cloud-sdk/install.sh --path-update true -q 

# Install Trivy
RUN wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key \
    | gpg --dearmor -o /usr/share/keyrings/trivy.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" \
    > /etc/apt/sources.list.d/trivy.list \
    && apt update \
    && apt install -y trivy \
    && apt clean

# Setting working directory and staging scripts to be used after startup
WORKDIR /htk
COPY startup.sh .

RUN mkdir tools
COPY tools.sh tools/
