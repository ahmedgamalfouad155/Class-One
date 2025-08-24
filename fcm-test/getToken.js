const { google } = require('googleapis');
const fs = require('fs');

const key = require('./service-account.json'); // اسم الملف JSON بتاعك

async function getAccessToken() {
  const auth = new google.auth.GoogleAuth({
    credentials: key,
    scopes: ['https://www.googleapis.com/auth/firebase.messaging']
  });

  const accessToken = await auth.getAccessToken();
  console.log(accessToken);
}

getAccessToken();
