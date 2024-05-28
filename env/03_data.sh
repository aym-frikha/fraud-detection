#!/bin/bash

sudo apt install python3-pip -y
pip install kaggle

/home/ubuntu/.local/bin/kaggle datasets download \
    -d nelgiriyewithana/credit-card-fraud-detection-dataset-2023 \
    -p data \
    --unzip
    