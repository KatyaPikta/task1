#!/bin/bash

set -e

echo "Обновление пакетов..."
sudo apt update -y

echo "Установка основных пакетов..."
sudo apt install -y \
    git \
    curl \
    wget \
    python3 \
    python3-pip \
    python3-venv \
    build-essential \
    git	\
    ansible

echo "Установка завершена!"
