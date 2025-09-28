#!/bin/bash
set -e

# Carpeta de backups con fecha y hora
BACKUP_DIR="BACKUP_$(date +%F_%H%M%S)"
mkdir -p "$BACKUP_DIR/lib"

# Lista de archivos críticos que queremos respaldar
FILES=(
  "lib/profile_page.dart"
  "lib/order_history_page.dart"
  "lib/admin_page.dart"
  "lib/product_page.dart"
  "lib/auth_page.dart"
  "pubspec.yaml"
  "firebase.json"
  "firestore.rules"
  "firestore.indexes.json"
)

echo "📦 Creando backup en $BACKUP_DIR ..."

for f in "${FILES[@]}"; do
  if [ -f "$f" ]; then
    mkdir -p "$BACKUP_DIR/$(dirname $f)"
    cp "$f" "$BACKUP_DIR/$f"
    echo "✅ $f respaldado"
  else
    echo "⚠️ $f no existe, se omite"
  fi
done

echo "🎉 Backup completado en $BACKUP_DIR"
