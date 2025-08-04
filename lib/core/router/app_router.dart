import 'package:go_router/go_router.dart';
import 'package:sinna/features/landing/presentation/views/landing_view.dart';
import 'package:sinna/features/landing/presentation/views/language_and_mode_view.dart';
import 'package:sinna/features/splash/splash._view.dart';

abstract class AppRouter {
  static const String klangageAndModeView = '/langaugeAndModeView'; 
  static const String klandingView = '/landingView';
  static String kSignUpView = '/signUpView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(
        path: klangageAndModeView,
        builder: (context, state) => LanguageAndModeView(),
      ),
      GoRoute(
        path: klandingView,
        builder: (context, state) => LandingView(),
      ),
    ],
  );
}
