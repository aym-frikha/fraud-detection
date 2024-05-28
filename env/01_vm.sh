#!/bin/bash

gcloud compute instances create bpk-data-platform --project=field-ai-ml-projects \
    --zone=europe-west1-b \
    --machine-type=e2-highmem-4 \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --metadata=ssh-keys=ubuntu:ssh-rsa\ AAAAB3NzaC1yc2EAAAADAQABAAABgQDvq4/W\+nNh98rZsm5yQtDxyHFdcfEITg1Go1xMtma51dF4Q0bwVXmWr9XXujU\+qWIdI6kGIeEDVQuScn0TA6fB4M21BfP/91vmapYnpuGipkjHcbfHwvj1u5FRGOv3o3suzzqYDmvxw3subIRFYycXEfGnsRSU/\+8dDv0C2BHaEEdrw\+qbJqQZJHBdM1o6Pxk\+g6UiH9EC2rJjfyXm\+8XTse794moSe7uXTI6PW8SQIbMR4r7EPeznxfj8rqzXQxT34igI4KIoBLfoZY\+uQOQmhzB7QVksyfbJ5av3DJjWPhf1uFoTu7iGj1xeXiEauxnrG4wsuopqMUGpT6G1FqbHJr2oVHMsRbSZFtdpso25UUwqXBraxUUTo4JjNpoxG3\+M3d4M7feQgAd0hX7m8\+yRZrwebEAaxqCTdTE8yi8Nu6fFEQP/NAevE7NtaDbvjagJFn//R28ICy9VZgF2O\+VxezZ3jdiyRhty9QW6rA29FX/sYD1NVZ8gPoNNYrKALI0=\ ubuntu \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --create-disk=auto-delete=yes,boot=yes,device-name=bpk-data-platform,image=projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20240519,mode=rw,size=150,type=projects/field-ai-ml-projects/zones/europe-west12-c/diskTypes/pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any
    