#!/bin/bash

# zkFlow.pro Website Deployment Script

echo "🚀 Deploying zkFlow.pro website..."

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR/website"

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
fi

# Build the project
echo "🔨 Building production bundle..."
npm run build

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "📥 Installing Vercel CLI..."
    npm i -g vercel
fi

# Deploy to Vercel
echo "☁️  Deploying to Vercel..."
vercel --prod --yes

echo "✅ Deployment complete!"
echo ""
echo "📋 Post-deployment checklist:"
echo "1. ✓ Update DNS records in Porkbun (see PORKBUN_DNS_SETUP.md)"
echo "2. ✓ Configure environment variables in Vercel dashboard"
echo "3. ✓ Set up Supabase project and run schema"
echo "4. ✓ Configure Stripe products and webhooks"
echo "5. ✓ Submit extension to Chrome Web Store"
echo ""
echo "🎯 Your site will be live at https://zkflow.pro once DNS propagates!"