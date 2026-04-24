#!/bin/bash
# Roda esse script na mesma pasta do index.html
# Ele cria a pasta weights/ e baixa os 4 arquivos de modelo

set -e
mkdir -p weights
BASE="https://cdn.jsdelivr.net/npm/face-api.js@0.22.2/weights"

echo "Baixando modelos do face-api.js..."

curl -fSL "$BASE/tiny_face_detector_model-weights_manifest.json" \
  -o weights/tiny_face_detector_model-weights_manifest.json && echo "✓ 1/4"

curl -fSL "$BASE/tiny_face_detector_model-shard1" \
  -o weights/tiny_face_detector_model-shard1 && echo "✓ 2/4"

curl -fSL "$BASE/face_landmark_68_tiny_model-weights_manifest.json" \
  -o weights/face_landmark_68_tiny_model-weights_manifest.json && echo "✓ 3/4"

curl -fSL "$BASE/face_landmark_68_tiny_model-shard1" \
  -o weights/face_landmark_68_tiny_model-shard1 && echo "✓ 4/4"

echo ""
echo "Concluído! Agora rode: python3 -m http.server 8080"
