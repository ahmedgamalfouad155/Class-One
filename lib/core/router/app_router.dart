import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:sinna/features/auth/presentation/view/login_view.dart';
import 'package:sinna/features/auth/presentation/view/signup_view.dart';
import 'package:sinna/features/auth/presentation/view/steps_academic_view.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/final_ui/view/register_view.dart';
import 'package:sinna/features/final_ui/view/final_signin_view.dart';
import 'package:sinna/features/final_ui/view/otp_view.dart';
import 'package:sinna/features/final_ui/view/study_location_view.dart';
import 'package:sinna/features/course_details/presentation/screens/course_video_view.dart';
import 'package:sinna/features/course_details/presentation/screens/courses_view.dart';
import 'package:sinna/features/course_details/presentation/screens/term_view.dart';
import 'package:sinna/features/landing/presentation/views/landing_view.dart';
import 'package:sinna/features/my_courses/presentation/view/user_ccourse_details_view.dart';
import 'package:sinna/features/nav_bar/presentation/view/nav_bar_view.dart';
import 'package:sinna/features/addmin/presentation/view/account_view.dart';
import 'package:sinna/features/addmin/presentation/view/control_panal_view.dart';
import 'package:sinna/features/profile/presentation/view/account_setting_view.dart';
import 'package:sinna/features/splash/splash._view.dart';

abstract class AppRouter {
  static const String klangageAndModeView = '/langaugeAndModeView';
  static const String klandingView = '/landingView';
  static const String kSignUpView = '/signUpView';
  static const String kStepsAcademicView = '/stepsAcademicView';
  static const String kLogInView = '/logInView';
  static const String kNavBarView = '/navBarView';
  static const String kTermView = '/termView';
  static const String kInstructorView = '/instructorView';
  static const String kCoursesView = '/lessonsView';
  static const String kCourseVideoView = '/courseVideoView';
  static const String kLanguageView = '/languageView';
  static const String kModeView = '/modeView';
  static const String kAccountView = '/accountView';
  static const String kUserCcourseDetailsView = '/userCcourseDetailsView';
  static const String kControlPanal = '/controlPanal';
  static const String kFinalRegister = '/registerfinal';
  static const String kFinalSignin = '/finalSignin';
  static const String kFinalOtpView = '/finalOtpView';
  static const String kStudyLocationView = '/studyLocationView';
  static const String kAccountSettingView = '/accountSettingView';

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
      GoRoute(
        path: klangageAndModeView,
        builder: (context, state) => const LandingView(),
      ),
      GoRoute(path: kLogInView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kStepsAcademicView,
        builder: (context, state) => const StepsAcademicView(),
      ),
      GoRoute(
        path: kNavBarView,
        builder: (context, state) => const NavBarView(),
      ),
      GoRoute(
        path: kTermView,
        builder: (context, state) {
          final coursePathModel = state.extra as CoursePathModel;
          return TermView(coursePathModel: coursePathModel);
        },
      ),
      GoRoute(
        path: klandingView,
        builder: (context, state) => const LandingView(),
      ),
      GoRoute(
        path: kCoursesView,
        builder: (context, state) {
          final coursePathModel = state.extra as CoursePathModel;
          return CoursesView(coursePathModel: coursePathModel);
        },
      ),
      GoRoute(
        path: kCourseVideoView,
        builder: (context, state) {
          final coursePathModel = state.extra as CourseModel;
          return CourseVideoView(course: coursePathModel);
        },
      ),
      
      GoRoute(
        path: kAccountView,
        builder: (context, state) => const AccountView(),
      ),

      GoRoute(
        path: kUserCcourseDetailsView,
        builder: (context, state) {
          final coursePathModel = state.extra as CoursePathModel;
          return UserCcourseDetailsView(coursePathModel: coursePathModel);
        },
      ),
      GoRoute(
        path: kControlPanal,
        builder: (context, state) => const ControlPanalView(),
      ),
      GoRoute(
        path: kFinalRegister,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kFinalRegister,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kFinalSignin,
        builder: (context, state) => const FinalSigninView(),
      ),
      GoRoute(
        path: kFinalOtpView,
        builder: (context, state) => const OtpView(),
      ),
      GoRoute(
        path: kStudyLocationView,
        builder: (context, state) => const StudyLocationView(),
      ),
      GoRoute(
        path: kAccountSettingView,
        builder: (context, state) => const AccountSettingView(),
      ),
    ],
  );
}
