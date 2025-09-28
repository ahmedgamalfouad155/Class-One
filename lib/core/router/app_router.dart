import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:sinna/features/auth/presentation/screens/login_screen.dart';
import 'package:sinna/features/auth/presentation/screens/signup_screen.dart';
import 'package:sinna/features/auth/presentation/screens/steps_academic_screen.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/final_ui/screens/register_screen.dart';
import 'package:sinna/features/final_ui/screens/final_signin_screen.dart';
import 'package:sinna/features/final_ui/screens/otp_screen.dart';
import 'package:sinna/features/final_ui/screens/study_location_screen.dart';
import 'package:sinna/features/course_details/presentation/screens/course_video_screen.dart';
import 'package:sinna/features/course_details/presentation/screens/courses_screen.dart';
import 'package:sinna/features/course_details/presentation/screens/term_screen.dart';
import 'package:sinna/features/my_courses/presentation/screens/user_ccourse_details_screen.dart';
import 'package:sinna/features/nav_bar/presentation/screens/nav_bar_screen.dart';
import 'package:sinna/features/addmin/presentation/screens/account_screen.dart';
import 'package:sinna/features/addmin/presentation/screens/control_panal_screen.dart';
import 'package:sinna/features/profile/presentation/screen/account_setting_screen.dart';
import 'package:sinna/features/splash/splash._screen.dart';

abstract class AppRouter {
  static const String klangageAndModeScreen = '/langaugeAndModeScreen';
  static const String klandingScreen = '/landingScreen';
  static const String kSignUpScreen = '/signUpView';
  static const String kStepsAcademicScreen = '/stepsAcademicScreen';
  static const String kLogInScreen = '/logInScreen';
  static const String kNavBarScreen = '/navBarScreen';
  static const String kTermScreen = '/termScreen';
  static const String kInstructorScreen = '/instructorScreen';
  static const String kCoursesScreen = '/lessonsScreen';
  static const String kCourseVideoScreen = '/courseVideoScreen';
  static const String kLanguageScreen = '/languageScreen';
  static const String kModeScreen = '/modeScreen';
  static const String kAccountScreen = '/accountScreen';
  static const String kUserCcourseDetailsScreen = '/userCcourseDetailsScreen';
  static const String kControlPanal = '/controlPanal';
  static const String kFinalRegister = '/registerfinal';
  static const String kFinalSignin = '/finalSignin';
  static const String kFinalOtpScreen = '/finalOtpScreen';
  static const String kStudyLocationScreen = '/studyLocationScreen';
  static const String kAccountSettingScreen = '/accountSettingScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return state is LoginSuccessState
                  ? const NavBarScreen()
                  : const SplashScreen();
            },
          );
        },
      ),

      GoRoute(
        path: kLogInScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: kStepsAcademicScreen,
        builder: (context, state) => const StepsAcademicScreen(),
      ),
      GoRoute(
        path: kNavBarScreen,
        builder: (context, state) => const NavBarScreen(),
      ),
      GoRoute(
        path: kTermScreen,
        builder: (context, state) {
          final coursePathModel = state.extra as CoursePathModel;
          return TermScreen(coursePathModel: coursePathModel);
        },
      ),

      GoRoute(
        path: kCoursesScreen,
        builder: (context, state) {
          final coursePathModel = state.extra as CoursePathModel;
          return CoursesScreen(coursePathModel: coursePathModel);
        },
      ),
      GoRoute(
        path: kCourseVideoScreen,
        builder: (context, state) {
          final coursePathModel = state.extra as CourseModel;
          return CourseVideoScreen(course: coursePathModel);
        },
      ),

      GoRoute(
        path: kAccountScreen,
        builder: (context, state) => const AccountScreen(),
      ),

      GoRoute(
        path: kUserCcourseDetailsScreen,
        builder: (context, state) {
          final coursePathModel = state.extra as CoursePathModel;
          return UserCcourseDetailsScreen(coursePathModel: coursePathModel);
        },
      ),
      GoRoute(
        path: kControlPanal,
        builder: (context, state) => const ControlPanalScreen(),
      ),
      GoRoute(
        path: kFinalRegister,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: kFinalRegister,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: kFinalSignin,
        builder: (context, state) => const FinalSigninScreen(),
      ),
      GoRoute(
        path: kFinalOtpScreen,
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: kStudyLocationScreen,
        builder: (context, state) => const StudyLocationScreen(),
      ),
      GoRoute(
        path: kAccountSettingScreen,
        builder: (context, state) => const AccountSettingScreen(),
      ),
    ],
  );
}
