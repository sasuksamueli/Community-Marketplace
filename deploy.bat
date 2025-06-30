@echo off
echo 🚀 Community Marketplace Deployment Script
echo ==========================================

REM Check if git is initialized
if not exist ".git" (
    echo ❌ Git repository not found. Please initialize git first:
    echo    git init
    echo    git add .
    echo    git commit -m "Initial commit"
    pause
    exit /b 1
)

REM Check if .env file exists
if not exist ".env" (
    echo ⚠️  No .env file found. Creating template...
    (
        echo # Database Configuration
        echo DB_HOST=localhost
        echo DB_USER=root
        echo DB_PASSWORD=
        echo DB_NAME=marketplace
        echo DB_PORT=3306
        echo.
        echo # Application Configuration
        echo NODE_ENV=development
        echo PORT=3000
    ) > .env
    echo ✅ Created .env template. Please update with your database credentials.
)

REM Build the application
echo 📦 Building the application...
call npm run build

if %ERRORLEVEL% EQU 0 (
    echo ✅ Build successful!
) else (
    echo ❌ Build failed. Please check the errors above.
    pause
    exit /b 1
)

echo.
echo 🎯 Choose your deployment platform:
echo 1. Vercel (Recommended for Next.js)
echo 2. Railway (Good for full-stack with database)
echo 3. Render (Good for full-stack apps)
echo 4. Heroku (Traditional option)
echo 5. Manual deployment instructions
echo.
set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" (
    echo 🚀 Deploying to Vercel...
    call npm install -g vercel
    call vercel --prod
) else if "%choice%"=="2" (
    echo 🚀 Deploying to Railway...
    echo Please follow these steps:
    echo 1. Go to https://railway.app
    echo 2. Sign up and connect your GitHub repository
    echo 3. Create a new project
    echo 4. Add a MySQL database service
    echo 5. Deploy your application
) else if "%choice%"=="3" (
    echo 🚀 Deploying to Render...
    echo Please follow these steps:
    echo 1. Go to https://render.com
    echo 2. Sign up and connect your GitHub repository
    echo 3. Create a new Web Service
    echo 4. Set build command: npm install ^&^& npm run build
    echo 5. Set start command: npm start
) else if "%choice%"=="4" (
    echo 🚀 Deploying to Heroku...
    call npm install -g heroku
    echo Please follow these steps:
    echo 1. Run: heroku login
    echo 2. Run: heroku create your-app-name
    echo 3. Run: heroku addons:create jawsdb:kitefin
    echo 4. Run: git push heroku main
) else if "%choice%"=="5" (
    echo 📖 Manual deployment instructions:
    echo 1. Set up a MySQL database (PlanetScale, Railway, AWS RDS, etc.)
    echo 2. Set environment variables:
    echo    - DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, DB_PORT
    echo    - NODE_ENV=production, PORT=3000
    echo 3. Deploy to your chosen platform
    echo 4. Run database initialization
) else (
    echo ❌ Invalid choice. Please run the script again.
    pause
    exit /b 1
)

echo.
echo 🎉 Deployment process initiated!
echo 📋 Next steps:
echo 1. Set up your database
echo 2. Configure environment variables
echo 3. Run database initialization
echo 4. Test your deployed application
echo.
echo 📚 For detailed instructions, see DEPLOYMENT.md
pause 