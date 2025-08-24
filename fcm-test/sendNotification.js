const { google } = require('googleapis');
const axios = require('axios');
const serviceAccount = require('./service-account.json'); // تأكد الاسم والمسار

const SCOPES = ['https://www.googleapis.com/auth/firebase.messaging'];

async function getAccessToken() {
  const jwtClient = new google.auth.JWT(
    serviceAccount.client_email,
    null,
    serviceAccount.private_key,
    SCOPES,
    null
  );
  const tokens = await jwtClient.authorize();
  return tokens.access_token;
}

async function sendNotification(topic, title, body) {
  const token = await getAccessToken();

  const message = {
    message: {
      topic: topic,
      notification: { title, body },
      data: { extraData: 'some_value' } // ممكن تعدلها على حسب الحاجة
    }
  };

  try {
    const res = await axios.post(
      `https://fcm.googleapis.com/v1/projects/${serviceAccount.project_id}/messages:send`,
      message,
      { headers: { Authorization: `Bearer ${token}`, 'Content-Type': 'application/json' } }
    );
    console.log('Notification sent:', res.data);
  } catch (err) {
    console.error('Error sending notification:', err.response?.data || err.message);
  }
}

// مثال للتجربة:
sendNotification('allUsers', 'Hello Admin', 'This is a test notification');
