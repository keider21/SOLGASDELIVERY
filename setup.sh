#!/bin/bash
set -e

# 1. Ruta al archivo JSON de credenciales
export GOOGLE_APPLICATION_CREDENTIALS="/workspaces/SOLGASDELIVERY/solgasdelivery-69729-4b9256d27cc9.json"

# 2. Autenticar la cuenta de servicio
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

# 3. Seleccionar proyecto de Firebase/Google Cloud
gcloud config set project solgasdelivery-69729

# 4. Obtener token de acceso de gcloud
TOKEN=$(gcloud auth print-access-token)

# 5. Inicializar Firebase en el proyecto
firebase init firestore hosting --project=solgasdelivery-69729 --token "$TOKEN"
