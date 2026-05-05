#!/usr/bin/env bash
# Instala Quarto en el entorno de build de Netlify y renderiza el sitio.
# Uso (Netlify): bash ./install_quarto.sh
set -euo pipefail

QUARTO_VERSION="1.5.57"
QUARTO_URL="https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz"

echo "==> Descargando Quarto ${QUARTO_VERSION}"
curl -L -o quarto.tar.gz "${QUARTO_URL}"

echo "==> Extrayendo Quarto"
mkdir -p .quarto
tar -xzf quarto.tar.gz -C .quarto --strip-components=1

export PATH="$PWD/.quarto/bin:$PATH"

echo "==> Versión de Quarto instalada:"
quarto --version

echo "==> Renderizando sitio"
quarto render

echo "==> Listo. Sitio disponible en _site/"
