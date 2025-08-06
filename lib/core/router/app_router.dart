import 'package:go_router/go_router.dart';
import 'package:sinna/features/auth/presentation/view/login_view.dart';
import 'package:sinna/features/auth/presentation/view/signup_view.dart';
import 'package:sinna/features/landing/presentation/views/landing_view.dart';
import 'package:sinna/features/landing/presentation/views/language_and_mode_view.dart';
import 'package:sinna/features/nav_bar/presentation/view/nav_bar_view.dart';
import 'package:sinna/features/splash/splash._view.dart';

abstract class AppRouter {
  static const String klangageAndModeView = '/langaugeAndModeView';
  static const String klandingView = '/landingView';
  static String kSignUpView = '/signUpView';
  static String kLogInView = '/logInView';
  static String kNavBarView = '/navBarView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(
        path: klangageAndModeView,
        builder: (context, state) => LanguageAndModeView(),
      ),
      GoRoute(path: klandingView, builder: (context, state) => LandingView()),
      GoRoute(path: kLogInView, builder: (context, state) => LoginView()),
      GoRoute(path: kSignUpView, builder: (context, state) => SignUpView()),
      GoRoute(path: kNavBarView, builder: (context, state) => NavBarView()), 
    ],
  );
}
