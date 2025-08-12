// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/thems.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/firebase_options.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenProtector.preventScreenshotOn();
  await ScreenProtector.preventScreenshotOn();

  if (Platform.isAndroid) {
    WebViewPlatform.instance = AndroidWebViewPlatform();
  } else if (Platform.isIOS) {
    WebViewPlatform.instance = WebKitWebViewPlatform();
  }

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
*/

/* 
admin email = ahmedgamal@gmail.com

user email = mohamedgamal@gmail.com


egypt
mansoura
Bachelors/Masters
level one


*/