import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/features/admin_tools/presentation/screens/control_panel_screen.dart';
import 'package:sinna/features/admin_tools/presentation/screens/create_course_screen.dart';
import 'package:sinna/features/admin_tools/presentation/screens/institutions_screen.dart';
import 'package:sinna/features/admin_tools/presentation/screens/instructors_screen.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:sinna/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:sinna/features/auth/presentation/screens/login_screen.dart';
import 'package:sinna/features/auth/presentation/screens/signup_screen.dart';
import 'package:sinna/features/auth/presentation/screens/steps_academic_screen.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/final_ui/screens/register_screen.dart';
import 'package:sinna/features/auth/presentation/screens/adding_phone_screen.dart';
import 'package:sinna/features/final_ui/screens/otp_screen.dart';
import 'package:sinna/features/final_ui/screens/study_location_screen.dart';
import 'package:sinna/features/course_details/presentation/screens/course_video_screen.dart';
import 'package:sinna/features/course_details/presentation/screens/courses_screen.dart';
import 'package:sinna/features/landing/presentation/screen/landing_screen.dart';
import 'package:sinna/features/my_courses/presentation/screens/user_course_details_screen.dart';
import 'package:sinna/features/nav_bar/presentation/screens/nav_bar_screen.dart';
import 'package:sinna/features/profile/presentation/screen/profile_screen.dart';
import 'package:sinna/features/profile/presentation/screen/name_screen.dart';
import 'package:sinna/features/profile/presentation/screen/password_screen.dart';
import 'package:sinna/features/splash/splash._screen.dart';

abstract class AppRouter {
  static const String klandingScreen = '/landingScreen';
  static const String kSignUpScreen = '/signUpView';
  static const String kConfirmingScreen = '/confirmingScreen';
  static const String kForgetPasswordScreen = '/forgetPasswordScreen';
  static const String kAddingPhoneScreen = '/addingPhoneScreen';
  static const String kStepsAcademicScreen = '/stepsAcademicScreen';
  static const String kLogInScreen = '/logInScreen';
  static const String kNavBarScreen = '/navBarScreen';
  static const String kInstructorScreen = '/instructorScreen';
  static const String kCoursesScreen = '/lessonsScreen';
  static const String kCourseVideoScreen = '/courseVideoScreen';
  static const String kLanguageScreen = '/languageScreen';
  static const String kModeScreen = '/modeScreen';
  static const String kUserCcourseDetailsScreen = '/userCcourseDetailsScreen';
  // static const String kControlPanal = '/controlPanal';
  static const String kFinalRegister = '/registerfinal';
  static const String kFinalSignin = '/finalSignin';
  static const String kFinalOtpScreen = '/finalOtpScreen';
  static const String kStudyLocationScreen = '/studyLocationScreen';
  static const String kAccountScreen = '/accountScreen';
  static const String kCreateCourseScreen = '/createCourseScreen';
  static const String kControlPanalScreen = '/controlPanalScreen';
  static const String kInstructorsScreen = '/instructorsScreen';
  static const String kInstitutionsScreen = '/institutionsScreen';
  static const String kNameScreen = '/nameScreen';
  static const String kPasswordScreen = '/passwordScreen';

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
        path: klandingScreen,
        builder: (context, state) => const LandingScreen(),
      ),
      GoRoute(
        path: kLogInScreen,
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        path: kForgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),

      GoRoute(
        path: kAddingPhoneScreen,
        builder: (context, state) => const AddingPhoneScreen(),
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
        path: kUserCcourseDetailsScreen,
        builder: (context, state) {
          final coursePathModel = state.extra as CoursePathModel;
          return UserCourseDetailsScreen(coursePathModel: coursePathModel);
        },
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
        builder: (context, state) => const AddingPhoneScreen(),
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
        path: kAccountScreen,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: kCreateCourseScreen,
        builder: (context, state) => const CreateCourseScreen(),
      ),
      GoRoute(
        path: kControlPanalScreen,
        builder: (context, state) => const ControlPanelScreen(),
      ),
      GoRoute(
        path: kInstructorScreen,
        builder: (context, state) => const InstructorsScreen(),
      ),
      GoRoute(
        path: kInstitutionsScreen,
        builder: (context, state) => const InstitutionsScreen(),
      ),
      GoRoute(
        path: kNameScreen,
        builder: (context, state) => const NameScreen(),
      ),
      GoRoute(
        path: kPasswordScreen,
        builder: (context, state) => const PasswordScreen(),
      ),
    ],
  );
}
