FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install core LFCS tools
RUN apt update && apt install -y \
    sudo \
    systemd \
    dbus \
    vim \
    nano \
    curl \
    wget \
    iproute2 \
    iputils-ping \
    net-tools \
    dnsutils \
    openssh-client \
    openssh-server \
    cron \
    gzip \
    bzip2 \
    tar \
    xz-utils \
    rsync \
    man \
    less \
    procps \
    passwd \
    acl \
    ufw \
    firewalld \
    && apt clean

# Create user 'mohammad' with sudo access
RUN useradd -ms /bin/bash mohammad && echo "mohammad:mohammad" | chpasswd && adduser mohammad sudo

# Expose SSH port (if needed)
EXPOSE 22

# Set workdir & switch to mohammad
WORKDIR /mnt/lfcs
# Copy custom app script to /usr/local/bin
COPY systemd/myapp.sh /usr/local/bin/myapp.sh
RUN chmod +x /usr/local/bin/myapp.sh

USER mohammad

CMD ["bash"]
