const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();
const db = admin.firestore();

// 1️⃣ إرسال إشعار لجهاز محدد (onCall)
exports.sendNotificationToToken = functions.https.onCall(async (data, context) => {
    const { title, body, token } = data;

    if (!token) {
        throw new functions.https.HttpsError(
            "invalid-argument",
            "FCM token is required",
        );
    }

    const message = {
        notification: { title, body },
        token: token,
    };

    try {
        await admin.messaging().send(message);
        return { success: true };
    } catch (error) {
        console.error("Error sending notification:", error);
        throw new functions.https.HttpsError("internal", error.message);
    }
});

// 2️⃣ إرسال إشعار لكل التوكينات المخزنة في Firestore (onRequest)
exports.sendNotificationToAll = functions.https.onRequest(async (req, res) => {
    try {
        const { title, body } = req.body;

        if (!title || !body) {
            return res.status(400).send("❌ لازم تبعت title و body في الـ request");
        }

        const snapshot = await db.collection("tokens").get();

        if (snapshot.empty) {
            return res.status(404).send("❌ مفيش أي tokens متسجلة");
        }

        const tokens = [];
        snapshot.forEach((doc) => {
            if (doc.id.length > 30) tokens.push(doc.id);
            if (doc.data().token) tokens.push(doc.data().token);
        });

        if (tokens.length === 0) {
            return res.status(404).send("❌ مفيش أي tokens valid");
        }

        const message = { notification: { title, body } };
        await admin.messaging().sendToDevice(tokens, message);

        return res
            .status(200)
            .send(`✅ إشعار بعنوان "${title}" اتبعت لـ ${tokens.length} جهاز`);
    } catch (error) {
        console.error("Error sending notification:", error);
        return res.status(500).send("❌ حصل خطأ أثناء إرسال الإشعار");
    }
});
