@echo off
REM Future Viz - Deployment Helper Script for Windows

echo.
echo 🚀 Future Viz Deployment Helper
echo ==================================
echo.

REM Check if we're in the right directory
if not exist "DEPLOY_NOW.md" (
    echo ❌ Please run this script from the project root directory
    exit /b 1
)

echo ✅ Project root detected
echo.

REM Frontend deployment instructions
echo 📦 FRONTEND DEPLOYMENT
echo ------------------------
echo.
echo To deploy the frontend to Vercel:
echo.
echo 1. Make sure you're logged in to Vercel:
echo    vercel login
echo.
echo 2. Deploy the frontend:
echo    cd frontend
echo    vercel --prod
echo.
echo 3. Note your Vercel deployment URL and set the API endpoint:
echo    - Go to https://vercel.com/dashboard
echo    - Select your project
echo    - Settings > Environment Variables
echo    - Add: VITE_API_URL = https://your-backend-url/api
echo    - Redeploy: vercel --prod
echo.
pause

echo.
REM Backend deployment instructions
echo 🔧 BACKEND DEPLOYMENT
echo ------------------------
echo.
echo To deploy the backend to Railway:
echo.
echo 1. Go to https://railway.app
echo 2. Click 'New Project' - 'Deploy from GitHub Repo'
echo 3. Select: yamanchhirush-glitch/future
echo 4. Add MongoDB plugin (Railway will provide connection string)
echo 5. Set Environment Variables:
echo    - JWT_SECRET = [generate a random string]
echo    - TWILIO_ACCOUNT_SID = [your SID]
echo    - TWILIO_AUTH_TOKEN = [your token]
echo    - TWILIO_PHONE_NUMBER = [your number]
echo.
echo Your backend will be available at: https://^<project-name^>.railway.app
echo.
pause

echo.
echo 📋 DEPLOYMENT CHECKLIST
echo ------------------------
echo.
echo [ ] Backend deployed on Railway/Heroku
echo [ ] Frontend deployed on Vercel
echo [ ] VITE_API_URL set in Vercel environment variables
echo [ ] MongoDB connection verified
echo [ ] Twilio credentials configured
echo [ ] Frontend can connect to backend API
echo.

echo ✨ You're ready to deploy!
echo.
pause
