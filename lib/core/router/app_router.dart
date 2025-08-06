import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/features/auth/presentation/view/login_view.dart';
import 'package:sinna/features/auth/presentation/view/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/auth/presentation/view/signup_view.dart';
import 'package:sinna/features/landing/presentation/views/landing_view.dart';
import 'package:sinna/features/landing/presentation/views/language_and_mode_view.dart';
import 'package:sinna/features/nav_bar/presentation/view/nav_bar_view.dart';
import 'package:sinna/features/splash/splash._view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static const String klangageAndModeView = '/langaugeAndModeView';
  static const String klandingView = '/landingView';
  static String kSignUpView = '/signUpView';
  static String kLogInView = '/logInView';
  static String kNavBarView = '/navBarView';

  static GoRouter router(BuildContext context) => GoRouter(
        initialLocation: '/',
        refreshListenable: context.read<AuthCubit>(), // لاحظ هنا
        redirect: (BuildContext context, GoRouterState state) {
          final authState = context.read<AuthCubit>().state;
          final isLoggingIn = state.fullPath == kLogInView || state.fullPath == kSignUpView;

          if (authState.status == AuthStatus.initial) {
            return null;
          }

          if (authState.status == AuthStatus.authenticated) {
            return kNavBarView;
          }

          if (authState.status == AuthStatus.unauthenticated && !isLoggingIn) {
            return kLogInView;
          }

          return null;
        },
        routes: [
          GoRoute(path: '/', builder: (context, state) => const SplashView()),
          GoRoute(path: klangageAndModeView, builder: (context, state) => const LanguageAndModeView()),
          GoRoute(path: klandingView, builder: (context, state) => const LandingView()),
          GoRoute(path: kLogInView, builder: (context, state) => const LoginView()),
          GoRoute(path: kSignUpView, builder: (context, state) => const SignUpView()),
          GoRoute(path: kNavBarView, builder: (context, state) => const NavBarView()),
        ],
      );
}
