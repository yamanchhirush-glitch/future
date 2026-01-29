# 🚀 Deployment Instructions

## GitHub (Backend) - Already Configured ✅

Your backend code is already pushed to:
```
https://github.com/yamanchhirush-glitch/future.git
```

The `backend/` folder contains the Node.js Express server.

---

## Vercel (Frontend) - Deploy Steps

### Prerequisites
- Vercel CLI installed ✅
- Vercel account: https://vercel.com/signup

### Step 1: Login to Vercel
```bash
vercel login
```

### Step 2: Deploy Frontend
```bash
cd frontend
vercel
```

### Step 3: Configure Environment Variables in Vercel Dashboard

1. Go to your Vercel project dashboard
2. Navigate to **Settings > Environment Variables**
3. Add the following variable:
   ```
   Name: VITE_API_URL
   Value: https://your-backend-domain.com/api
   ```
   (Replace with your actual backend URL)

4. Redeploy with the new environment variable:
   ```bash
   vercel --prod
   ```

### Step 4: Update Frontend API Proxy

Edit `frontend/vite.config.js` to use the environment variable:
```javascript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    port: 3000,
    proxy: {
      '/api': process.env.VITE_API_URL || 'http://localhost:5000'
    }
  }
})
```

---

## Backend Deployment Options

### Option A: Railway.app (Recommended - Free tier available)

1. Go to https://railway.app
2. Click "New Project" → "Deploy from GitHub"
3. Connect your GitHub account
4. Select the `yamanchhirush-glitch/future` repository
5. Railway will auto-detect it's a Node.js app
6. Add MongoDB plugin:
   - Click "Add Service" → "MongoDB"
7. Configure Environment Variables:
   - `PORT`: 8000
   - `MONGODB_URI`: (auto-filled by MongoDB plugin)
   - `JWT_SECRET`: Generate a random string
   - `TWILIO_ACCOUNT_SID`: Your Twilio SID
   - `TWILIO_AUTH_TOKEN`: Your Twilio token
   - `TWILIO_PHONE_NUMBER`: Your Twilio number
8. Railway will auto-deploy on every push to main

**Your backend URL will be:** `https://your-railway-app.railway.app`

### Option B: Heroku (requires credit card)

```bash
# Install Heroku CLI (if not installed)
# Windows: https://devcenter.heroku.com/articles/heroku-cli

heroku login
cd backend
heroku create future-viz-backend
heroku config:set JWT_SECRET=your_secret_key
heroku config:set MONGODB_URI=your_mongodb_uri
heroku config:set TWILIO_ACCOUNT_SID=your_sid
heroku config:set TWILIO_AUTH_TOKEN=your_token
heroku config:set TWILIO_PHONE_NUMBER=your_number

git push heroku main
```

### Option C: DigitalOcean / AWS / Google Cloud

See [DEPLOYMENT.md](../DEPLOYMENT.md) for detailed instructions.

---

## Final Step: Connect Frontend to Backend

Once your backend is deployed:

1. Get your backend URL (e.g., `https://future-viz-backend.railway.app`)
2. In Vercel Dashboard:
   - Go to project settings
   - Set `VITE_API_URL` environment variable
   - Redeploy: `vercel --prod`

3. Verify API communication:
   - Frontend will now proxy `/api/*` requests to your backend

---

## Verification Checklist

- [ ] Backend deployed and running on production URL
- [ ] Frontend deployed on Vercel
- [ ] API environment variable set in Vercel
- [ ] Frontend can make API requests to backend
- [ ] MongoDB connected (if using managed service)
- [ ] Twilio credentials configured
- [ ] SSL/HTTPS enabled (automatic on Vercel & Railway)

---

## Useful Links

- **Vercel Dashboard**: https://vercel.com/dashboard
- **Railway Dashboard**: https://railway.app
- **GitHub Repository**: https://github.com/yamanchhirush-glitch/future
- **Heroku Dashboard**: https://dashboard.heroku.com

---

## Troubleshooting

**Frontend can't reach backend?**
- Check `VITE_API_URL` environment variable in Vercel
- Check backend is running and accessible
- Check CORS configuration in `backend/src/index.js`

**Backend crashes on startup?**
- Check MongoDB connection string
- Verify all required environment variables are set
- Check logs in deployment dashboard

**Build fails on Vercel?**
- Run `npm run build` locally to test
- Check that all dependencies are listed in `package.json`
- Verify Node.js version compatibility
