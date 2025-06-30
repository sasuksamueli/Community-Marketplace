# 🚀 Quick Deploy Guide

## Option 1: Vercel (Fastest - Recommended)

### Step 1: Prepare Your Code
```bash
# Initialize git if not already done
git init
git add .
git commit -m "Initial commit"

# Push to GitHub (create a new repository first)
git remote add origin https://github.com/yourusername/community-marketplace.git
git push -u origin main
```

### Step 2: Deploy to Vercel
1. Go to [vercel.com](https://vercel.com)
2. Sign up/Login with GitHub
3. Click "New Project"
4. Import your GitHub repository
5. Configure:
   - Framework Preset: `Other`
   - Build Command: `npm run build`
   - Output Directory: `.next`
   - Install Command: `npm install`
6. Add Environment Variables:
   ```
   DB_HOST=your-database-host
   DB_USER=your-database-user
   DB_PASSWORD=your-database-password
   DB_NAME=your-database-name
   DB_PORT=3306
   NODE_ENV=production
   ```
7. Click "Deploy"

### Step 3: Set Up Database
1. Go to [planetscale.com](https://planetscale.com) (free tier)
2. Create a new database
3. Copy the connection string
4. Update your Vercel environment variables

## Option 2: Railway (All-in-One)

### Step 1: Deploy
1. Go to [railway.app](https://railway.app)
2. Sign up with GitHub
3. Click "New Project"
4. Select "Deploy from GitHub repo"
5. Choose your repository
6. Add a MySQL database service
7. Railway will automatically set environment variables

### Step 2: Configure
1. Go to your project settings
2. Add environment variables if needed
3. Deploy automatically happens on git push

## Option 3: Render (Simple)

### Step 1: Deploy
1. Go to [render.com](https://render.com)
2. Sign up with GitHub
3. Click "New Web Service"
4. Connect your repository
5. Configure:
   - Name: `community-marketplace`
   - Environment: `Node`
   - Build Command: `npm install && npm run build`
   - Start Command: `npm start`
6. Add environment variables
7. Click "Create Web Service"

## Database Setup Options

### 1. PlanetScale (Recommended)
- Free tier available
- Automatic scaling
- Easy setup

### 2. Railway Database
- Integrated with Railway deployment
- Automatic environment variables

### 3. Supabase (Alternative)
- PostgreSQL instead of MySQL
- Free tier available
- Great developer experience

## Environment Variables Needed

```env
DB_HOST=your-database-host
DB_USER=your-database-user
DB_PASSWORD=your-database-password
DB_NAME=your-database-name
DB_PORT=3306
NODE_ENV=production
PORT=3000
```

## After Deployment

1. **Test your application**
2. **Set up your database schema**:
   ```bash
   # Run the database initialization
   npm run init-db
   ```
3. **Monitor your application**
4. **Set up custom domain** (optional)

## Troubleshooting

### Common Issues:
1. **Build fails**: Check build logs for errors
2. **Database connection fails**: Verify environment variables
3. **App crashes**: Check application logs
4. **Images not loading**: Ensure image paths are correct

### Quick Fixes:
- Clear build cache
- Restart the deployment
- Check environment variables
- Verify database connection

## Support

- Check platform documentation
- Review application logs
- Test locally with production environment variables 