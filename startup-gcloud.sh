#!/bin/bash
# startup.sh 
# Start up script to run interactively. Mod as needed.

if [ -t 1 ]; then
  echo "Interactive shell detected"
  echo "Logging into gcloud using auth login..."
  gcloud auth login --no-launch-browser
else
  echo "Non-interactive shell — skipping gcloud login"
fi

echo "Installing required kubectl auth plugin for GKE..."
gcloud components install gke-gcloud-auth-plugin -y
