#!/bin/bash

echo "🚀 Community Marketplace Deployment Script"
echo "=========================================="

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "❌ Git repository not found. Please initialize git first:"
    echo "   git init"
    echo "   git add ."
    echo "   git commit -m 'Initial commit'"
    exit 1
fi

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "⚠️  No .env file found. Creating template..."
    cat > .env << EOF
# Database Configuration
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=marketplace
DB_PORT=3306

# Application Configuration
NODE_ENV=development
PORT=3000
EOF
    echo "✅ Created .env template. Please update with your database credentials."
fi

# Build the application
echo "📦 Building the application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
else
    echo "❌ Build failed. Please check the errors above."
    exit 1
fi

echo ""
echo "🎯 Choose your deployment platform:"
echo "1. Vercel (Recommended for Next.js)"
echo "2. Railway (Good for full-stack with database)"
echo "3. Render (Good for full-stack apps)"
echo "4. Heroku (Traditional option)"
echo "5. Manual deployment instructions"
echo ""
read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        echo "🚀 Deploying to Vercel..."
        if ! command -v vercel &> /dev/null; then
            echo "📥 Installing Vercel CLI..."
            npm install -g vercel
        fi
        vercel --prod
        ;;
    2)
        echo "🚀 Deploying to Railway..."
        echo "Please follow these steps:"
        echo "1. Go to https://railway.app"
        echo "2. Sign up and connect your GitHub repository"
        echo "3. Create a new project"
        echo "4. Add a MySQL database service"
        echo "5. Deploy your application"
        ;;
    3)
        echo "🚀 Deploying to Render..."
        echo "Please follow these steps:"
        echo "1. Go to https://render.com"
        echo "2. Sign up and connect your GitHub repository"
        echo "3. Create a new Web Service"
        echo "4. Set build command: npm install && npm run build"
        echo "5. Set start command: npm start"
        ;;
    4)
        echo "🚀 Deploying to Heroku..."
        if ! command -v heroku &> /dev/null; then
            echo "📥 Installing Heroku CLI..."
            npm install -g heroku
        fi
        echo "Please follow these steps:"
        echo "1. Run: heroku login"
        echo "2. Run: heroku create your-app-name"
        echo "3. Run: heroku addons:create jawsdb:kitefin"
        echo "4. Run: git push heroku main"
        ;;
    5)
        echo "📖 Manual deployment instructions:"
        echo "1. Set up a MySQL database (PlanetScale, Railway, AWS RDS, etc.)"
        echo "2. Set environment variables:"
        echo "   - DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, DB_PORT"
        echo "   - NODE_ENV=production, PORT=3000"
        echo "3. Deploy to your chosen platform"
        echo "4. Run database initialization"
        ;;
    *)
        echo "❌ Invalid choice. Please run the script again."
        exit 1
        ;;
esac

echo ""
echo "🎉 Deployment process initiated!"
echo "📋 Next steps:"
echo "1. Set up your database"
echo "2. Configure environment variables"
echo "3. Run database initialization"
echo "4. Test your deployed application"
echo ""
echo "📚 For detailed instructions, see DEPLOYMENT.md" 