#!/bin/bash

# Update dan install dependencies dasar
echo "🧰 Updating system & installing dependencies..."
apt update && apt install -y curl screen

# Install Bun
echo "📦 Installing Bun..."
curl -fsSL https://bun.sh/install | bash

# Load Bun ke PATH (buat sementara session ini)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Install Kuzco
echo "🧠 Installing Kuzco..."
curl -fsSL https://inference.supply/install.sh | sh

# Cek apakah screen session sudah ada
if screen -list | grep -q "kuzco"; then
  echo "⚠️  Screen session 'kuzco' already exists. Skipping creation."
else
  echo "🖥️  Creating screen session 'kuzco' and starting worker..."

  # Jalankan worker di dalam screen session
  screen -dmS kuzco bash -c "kuzco worker start --worker c_9FmrvaqCUiKO8zT9Kn3 --code 8c313928-beae-43b5-b259-3471361f0657"
fi

echo "✅ Setup selesai. Gunakan 'screen -r kuzco' untuk lihat worker."

