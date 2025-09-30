import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/services/firebase/firebase_service.dart';
import 'package:sinna/core/services/device/permission_service.dart';
import 'package:sinna/core/services/device/screen_protector_service.dart';
import 'package:sinna/core/services/device/webview_service.dart';
import 'package:sinna/core/services/notifications/local_notification_service.dart';
import 'package:sinna/core/services/notifications/push_notification_service.dart';
import 'package:sinna/core/theme/thems.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 1. Firebase Init
  await FirebaseService.initializeFirebase();

  // 2. حماية السكرين
  await ScreenProtectorService.preventScreenshots();
  // منع الفون من وضح الانقلاب
  await ScreenProtectorService.setPreferredOrientations();

  // 3. تهيئة WebView
  WebViewService.setupWebView();

  // 4. طلب صلاحيات الاشعارات
  await PermissionService.requestNotificationPermission();

  // 5. تهيئة FCM Background Handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // 6. تهيئة Notifications
  await LocalNotificationService.initialize();
  await PushNotificationService.initialize();

  await FirebaseMessaging.instance.subscribeToTopic("allUsers");

  

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => AuthCubit()..authStatus(),
          child: Builder(
            builder: (context) {
              return MaterialApp.router(
                title: 'Sinna',
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
              );
            },
          ),
        );
      },
    );
  }
}

/*
develop
feature/Auth
feature/Navbar
feature/categories
feature/profile
feature/my_courses


*/

/* 
admin email = ahmedgamal@gmail.com

user email = mohamedgamal@gmail.com


egypt
mansoura
Bachelors/Masters
level one


*/
