import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/features/admin_tools/data/models/field_model.dart';
import 'package:sinna/features/admin_tools/presentation/screens/admins_screen.dart';
import 'package:sinna/features/admin_tools/presentation/screens/control_panel_screen.dart';
import 'package:sinna/features/admin_tools/presentation/screens/fields_screen.dart';
import 'package:sinna/features/admin_tools/presentation/screens/field_name_and_institutions_screen.dart';
import 'package:sinna/features/admin_tools/presentation/screens/instructors_screen.dart';
import 'package:sinna/features/admin_tools/presentation/screens/participants_screen.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:sinna/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:sinna/features/auth/presentation/screens/login_screen.dart';
import 'package:sinna/features/auth/presentation/screens/signup_screen.dart';

import 'package:sinna/features/course_details/data/models/course_video_args_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/auth/presentation/screens/adding_phone_screen.dart';
import 'package:sinna/features/course_details/presentation/screens/course_video_screen.dart';
import 'package:sinna/features/course_details/presentation/screens/courses_screen.dart';
import 'package:sinna/features/landing/presentation/screen/landing_screen.dart';
import 'package:sinna/features/my_courses/presentation/screens/user_course_details_screen.dart';
import 'package:sinna/features/nav_bar/presentation/screens/nav_bar_screen.dart';
import 'package:sinna/features/profile/presentation/screen/preferences_screen.dart';
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
  static const String kFinalRegister = '/registerfinal';
  static const String kFinalSignin = '/finalSignin';
  static const String kFinalOtpScreen = '/finalOtpScreen';
  static const String kStudyLocationScreen = '/studyLocationScreen';
  static const String kAccountScreen = '/accountScreen';
  static const String kCreateCourseScreen = '/createCourseScreen';
  static const String kControlPanalScreen = '/controlPanalScreen';
  static const String kInstructorsScreen = '/instructorsScreen';
  static const String kFieldNameAndInstitutionsScreen = '/institutionsScreen';
  static const String kNameScreen = '/nameScreen';
  static const String kPasswordScreen = '/passwordScreen';
  static const String kPreferencesScreen = '/preferencesScreen';
  static const String kFildsScreen = '/fildsScreen';
  static const String kParticipantsScreen = '/participantsScreen';
  static const String kAdminsScreen = '/adminsScreen';
  static const String kFieldNameScreen = '/fieldNameScreen';

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
          final args = state.extra as CourseVideoArgs;
          return CourseVideoScreen(
            lessonId: args.lessonId,
            coursePathModel: args.coursePathModel,
          );
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
        path: kFinalSignin,
        builder: (context, state) => const AddingPhoneScreen(),
      ),
      GoRoute(
        path: kAccountScreen,
        builder: (context, state) => const ProfileScreen(),
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
        path: kFieldNameAndInstitutionsScreen,
        builder: (context, state) {
          final fieldModel = state.extra as FieldModel;
          return FieldNameAndInstitutionsScreen(fieldModel: fieldModel);
        },
      ),
      GoRoute(
        path: kNameScreen,
        builder: (context, state) => const NameScreen(),
      ),
      GoRoute(
        path: kPasswordScreen,
        builder: (context, state) => const PasswordScreen(),
      ),
      GoRoute(
        path: kPreferencesScreen,
        builder: (context, state) => const PreferencesScreen(),
      ),
      GoRoute(
        path: kFildsScreen,
        builder: (context, state) => const FildsScreen(),
      ),
      GoRoute(
        path: kParticipantsScreen,
        builder: (context, state) => const ParticipantsScreen(),
      ),
      GoRoute(
        path: kAdminsScreen,
        builder: (context, state) => const AdminsScreen(),
      ),
    ],
  );
}
