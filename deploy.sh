#!/bin/bash
set -e
NOW=$(date "+%Y-%m-%d %H:%M:%S")

echo "📘 [${NOW}] Building Quarto site..."
quarto render

echo "🚀 Deploying to Netlify (production)..."
netlify deploy --prod --dir=_site

echo "📦 Committing source updates to Git..."
git add .
git commit -m "Quarto update: ${NOW}"
git push

echo "✅ Site published and source pushed!"