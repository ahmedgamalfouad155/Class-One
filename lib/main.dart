import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/thems.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => AuthCubit(_firebaseAuth),
          child: Builder(
            builder: (context) {
              final router = AppRouter.router(context); // يتم استدعاؤه بعد توفير AuthCubit
              return MaterialApp.router(
                title: 'Sinna',
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: ThemeMode.system,
                debugShowCheckedModeBanner: false,
                routerConfig: router,
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
*/