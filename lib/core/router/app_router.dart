import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:sinna/features/auth/presentation/view/login_view.dart';
import 'package:sinna/features/auth/presentation/view/signup_view.dart';
import 'package:sinna/features/categories/data/models/lesson_path_model.dart';
import 'package:sinna/features/categories/presentation/view/instractor_view.dart';
import 'package:sinna/features/categories/presentation/view/lessons_view.dart';
import 'package:sinna/features/categories/presentation/view/term_view.dart';
import 'package:sinna/features/landing/presentation/views/landing_view.dart';
import 'package:sinna/features/landing/presentation/views/language_and_mode_view.dart';
import 'package:sinna/features/nav_bar/presentation/view/nav_bar_view.dart';
import 'package:sinna/features/splash/splash._view.dart';

abstract class AppRouter {
  static const String klangageAndModeView = '/langaugeAndModeView';
  static const String klandingView = '/landingView';
  static const String kSignUpView = '/signUpView';
  static const String kLogInView = '/logInView';
  static const String kNavBarView = '/navBarView';
  static const String kTermView = '/termView';
  static const String kInstructorView = '/instructorView';
  static const String kLessonsView = '/lessonsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return state is LoginSuccessState
                  ? const NavBarView()
                  : const SplashView();
            },
          );
        },
      ),
      GoRoute(path: kLogInView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kNavBarView,
        builder: (context, state) => const NavBarView(),
      ),
      GoRoute(path: kTermView, builder: (context, state) {
        final lessonPathModel = state.extra as LessonPathModel;
        return  TermView(lessonPathModel: lessonPathModel ,);
      }),
      GoRoute(
        path: kInstructorView,
        builder: (context, state) {
          final lessonPathModel = state.extra as LessonPathModel;
          return InstractorView(lessonPathModel:lessonPathModel );
        },
      ),
      GoRoute(
        path: klandingView,
        builder: (context, state) => const LandingView(),
      ),
      GoRoute(
        path: klangageAndModeView,
        builder: (context, state) => const LanguageAndModeView(),
      ),
      GoRoute(
        path: kLessonsView,
        builder: (context, state) {
          final lessonPathModel = state.extra as LessonPathModel;
          return  LessonsView( lessonPathModel: lessonPathModel,);
        },
      ),
    ],
  );
}
