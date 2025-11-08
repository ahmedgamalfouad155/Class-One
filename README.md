# 📚 Edumed - Educational Courses Platform

**🗓 Duration:** October 2025 – Present  
**📱 Project Type:** Mobile Application (Flutter)  
**💻 Platforms:** Android & iOS  

---

## 🌟 Overview

**Edumed** is an educational platform providing paid courses for dentistry and other university programs. Users can discover, subscribe to, and access courses securely, while administrators and support staff have full control over course management.

The app ensures content protection and user privacy through advanced restrictions, offering a professional solution for educational institutions and learners.

---

## 🎯 Features

### 👤 For Users:
- **Course Access:** View all subscribed courses in the "My Courses" section.  
- **Discover Courses:** Browse all available courses in the "Discover" section.  
- **Profile Management:**  
  - Update personal information (name, password).  
  - Change app theme and language.  
  - Contact support via **WhatsApp directly from the app**.  
  - Delete account if desired.  
- **Security:**  
  - Screen capture and recording protection.  
  - Single device login restriction to prevent account sharing.

### 🛠 For Admin & Support:
- **Course Management:**  
  - Add new courses.  
  - Edit or delete existing courses.  
  - Activate or assign courses to specific users.  
- **User Support:** Assist users with subscriptions and payments.

---

## ⚙️ Architecture & Technology
- **Frontend:** Flutter  
- **Backend:** Firebase Authentication & Firestore (for courses and user data)  
- **State Management:** Cubit/BLoC (for responsive UI & data handling)  
- **Security Features:**  
  - Protection against screenshots and screen recording.  
  - Single-session login enforcement.

---

## 📝 How It Works
1. Users contact support via WhatsApp to subscribe to paid courses.  
2. Support activates purchased courses, which appear in the user's "My Courses" section.  
3. Users can browse available courses, manage their profile, and interact securely.  
4. Admins and support staff have full control over course and user management.

---

## ✨ Highlights
- Secure delivery of paid content.  
- Multi-role support: user, admin, and support.  
- Highly interactive and user-friendly interface.  
- Cross-platform support for both Android and iOS.  

---

## 🗂 Repository Structure

```bash
lib/
├── core/
│   ├── constants/        
│   ├── cubit/            
│   ├── helper/           
│   ├── router/           
│   ├── services/        
│   ├── theme/            
│   ├── utils/           
│   └── widgets/          
├── features/
│   ├── admin/          
│   │   ├── data/
│   │   │   ├── models/      
│   │   │   └── service/     
│   │   └── presentation/
│   │       ├── manager/    
│   │       ├── screens/  
│   │       └── widgets/    
│   ├── auth/               
│   ├── course_details/     
│   ├── explore/            
