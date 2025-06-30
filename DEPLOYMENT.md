# Community Marketplace - Deployment Guide

This guide will help you deploy your Community Marketplace application to various platforms.

## Prerequisites

1. **Database Setup**: You'll need a MySQL database. Options include:
   - PlanetScale (Recommended for production)
   - Railway Database
   - AWS RDS
   - DigitalOcean Managed MySQL
   - Local MySQL (for development)

2. **Environment Variables**: You'll need to set up these environment variables:
   ```
   DB_HOST=your-database-host
   DB_USER=your-database-user
   DB_PASSWORD=your-database-password
   DB_NAME=your-database-name
   DB_PORT=3306
   NODE_ENV=production
   PORT=3000
   ```

## Deployment Options

### Option 1: Vercel (Recommended)

Vercel is the easiest option for Next.js applications.

#### Steps:
1. **Install Vercel CLI**:
   ```bash
   npm i -g vercel
   ```

2. **Login to Vercel**:
   ```bash
   vercel login
   ```

3. **Deploy**:
   ```bash
   vercel --prod
   ```

4. **Set Environment Variables**:
   - Go to your Vercel dashboard
   - Navigate to your project settings
   - Add your environment variables

#### Database Setup for Vercel:
- Use PlanetScale (free tier available)
- Or Railway Database
- Update your environment variables with the database connection string

### Option 2: Railway

Railway is great for full-stack applications with databases.

#### Steps:
1. **Sign up** at [railway.app](https://railway.app)
2. **Connect your GitHub repository**
3. **Create a new project**
4. **Add a MySQL database service**
5. **Deploy your application**

#### Environment Variables:
Railway will automatically provide database environment variables.

### Option 3: Render

Render is another good option for full-stack applications.

#### Steps:
1. **Sign up** at [render.com](https://render.com)
2. **Connect your GitHub repository**
3. **Create a new Web Service**
4. **Configure the build settings**:
   - Build Command: `npm install && npm run build`
   - Start Command: `npm start`

### Option 4: Heroku

#### Steps:
1. **Install Heroku CLI**:
   ```bash
   npm install -g heroku
   ```

2. **Login to Heroku**:
   ```bash
   heroku login
   ```

3. **Create Heroku app**:
   ```bash
   heroku create your-app-name
   ```

4. **Add MySQL addon**:
   ```bash
   heroku addons:create jawsdb:kitefin
   ```

5. **Deploy**:
   ```bash
   git add .
   git commit -m "Deploy to Heroku"
   git push heroku main
   ```

## Database Setup

### Option 1: PlanetScale (Recommended)

1. **Sign up** at [planetscale.com](https://planetscale.com)
2. **Create a new database**
3. **Get your connection string**
4. **Update environment variables**

### Option 2: Railway Database

1. **Create a new Railway project**
2. **Add MySQL database service**
3. **Copy the connection details**

### Option 3: AWS RDS

1. **Create an RDS MySQL instance**
2. **Configure security groups**
3. **Get connection details**

## Environment Variables Setup

You'll need to set these environment variables in your deployment platform:

```env
DB_HOST=your-database-host
DB_USER=your-database-user
DB_PASSWORD=your-database-password
DB_NAME=your-database-name
DB_PORT=3306
NODE_ENV=production
PORT=3000
```

## Database Migration

After setting up your database, you'll need to run the database initialization:

1. **For Vercel**: Add a build script to run database initialization
2. **For Railway/Render**: Run the initialization manually or add it to the build process

## Troubleshooting

### Common Issues:

1. **Database Connection Failed**:
   - Check your environment variables
   - Ensure your database is accessible from your deployment platform
   - Check firewall settings

2. **Build Failures**:
   - Check the build logs
   - Ensure all dependencies are in package.json
   - Check TypeScript errors

3. **Runtime Errors**:
   - Check the application logs
   - Verify environment variables are set correctly

## Monitoring

After deployment, monitor your application:
- Check application logs
- Monitor database performance
- Set up error tracking (Sentry, LogRocket, etc.)

## SSL/HTTPS

Most deployment platforms automatically provide SSL certificates. Ensure your application is served over HTTPS in production.

## Performance Optimization

1. **Enable Next.js optimizations**:
   - Image optimization
   - Code splitting
   - Static generation where possible

2. **Database optimization**:
   - Add proper indexes
   - Optimize queries
   - Use connection pooling

## Support

If you encounter issues:
1. Check the platform's documentation
2. Review application logs
3. Test locally with production environment variables 