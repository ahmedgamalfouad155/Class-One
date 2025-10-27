import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/services/firebase/firebase_service.dart';
import 'package:sinna/core/services/device/permission_service.dart';
import 'package:sinna/core/services/device/screen_protector_service.dart';
import 'package:sinna/core/services/device/webview_service.dart';
import 'package:sinna/core/services/notifications/local_notification_service.dart';
import 'package:sinna/core/services/notifications/push_notification_service.dart';
import 'package:sinna/core/theme/thems.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart'; 
import 'package:sinna/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:sinna/firebase_options.dart';
import 'package:sinna/generated/codegen_loader.g.dart';

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

  await Hive.initFlutter();
  await Hive.openBox(AppConstants.hiveBoxName);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [ 

            BlocProvider(create: (_) => AuthCubit()..authStatus()), 
            BlocProvider(create: (_) => ThemeCubit()..loadTheme()),
          ],
          child: Builder(
            builder: (context) {
              return BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, state) {
                  return MaterialApp.router(
                    title: 'Sinna',
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    themeMode: state,
                    debugShowCheckedModeBanner: false,
                    routerConfig: AppRouter.router,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}


// flutter pub run easy_localization:generate --source-dir ./assets/translations
// flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart