const admin = require("firebase-admin");

// تحميل ملف الـ JSON اللي نزلته
const serviceAccount = require("./class-one-9958e-bfdb4564d9cf.json");

// تهيئة Firebase Admin SDK
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

// رسالة تجريبية
const message = {
  notification: {
    title: "رسالة من الأدمن 🚀",
    body: "لو الرسالة دي وصلت يبقى الدنيا شغالة 100%",
  },
  topic: "allUsers", // لازم الأجهزة تكون مشتركة في التوبيك ده
};

// إرسال الرسالة
admin.messaging().send(message)
  .then((response) => {
    console.log("✅ تم إرسال الإشعار بنجاح:", response);
  })
  .catch((error) => {
    console.error("❌ حصل خطأ أثناء الإرسال:", error);
  });
