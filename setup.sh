#!/bin/bash

echo "🔧 Installing Kuzco..."
curl -fsSL https://inference.supply/install.sh | sh

echo "🚀 Starting Kuzco Worker..."
kuzco worker start --worker c_9FmrvaqCUiKO8zT9Kn3 --code 8c313928-beae-43b5-b259-3471361f0657
