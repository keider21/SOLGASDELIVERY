#!/bin/bash
set -e

echo "🧹 1) Limpiando proyecto..."
flutter clean

echo "📦 2) Instalando dependencias..."
flutter pub get

echo "🎨 3) Generando íconos y splash..."
flutter pub run flutter_launcher_icons
flutter pub run flutter_native_splash:create

echo "🌐 4) Compilando para Web (release, optimizado)..."
flutter build web --release --no-tree-shake-icons --pwa-strategy=none

echo "🚀 5) Subiendo a Firebase Hosting..."
firebase deploy --only hosting

echo "✅ Proceso completado con éxito!"
