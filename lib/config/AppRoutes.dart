import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pdd_flutter_new_24_04_25/features/profile/view/profile_view.dart';
import 'package:pdd_flutter_new_24_04_25/features/rating/view/rating_view.dart';
import 'package:pdd_flutter_new_24_04_25/features/registration/on_boarding_view.dart';
import 'package:pdd_flutter_new_24_04_25/features/video/view/video_player.dart';
import 'package:pdd_flutter_new_24_04_25/features/video/view/video_view.dart';
import '../features/bottombar/bottom_bar.dart';
import '../features/home/view/home_view.dart';
import '../features/home/view/lesson/lesson_view.dart';
import '../features/registration/register/view/registration_view.dart';
import '../features/video/view/details_video_view.dart';
import 'SharedPrefsHelper.dart';

class AppRoutes {
  static const String onBoardingPath = '/onboarding';
  static const String homePath = '/home';
  static const String videoPath = '/video';
  static const String ratingPath = '/rating';
  static const String profilePath = '/profile';
  static const String registrationPath = '/registration';
  static const String videoDetailPath = '/video-detail';
  static const String videoPlayerPath = '/video_player';
  static const String lessonPath = '/lesson';
}

class AppRoutesHelper {
  static final AppRoutesHelper _instance = AppRoutesHelper._internal();

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  static AppRoutesHelper get instance => _instance;

  factory AppRoutesHelper() {
    return _instance;
  }

  AppRoutesHelper._internal() {
    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: _getInitialRoute(),
      routes: [
        GoRoute(
          path: AppRoutes.onBoardingPath,
          builder: (context, state) => OnBoardingView(),
        ),
        GoRoute(
          path: AppRoutes.registrationPath,
          builder: (context, state) => RegistrationView(),
        ),
        GoRoute(
          path: AppRoutes.videoDetailPath,
          parentNavigatorKey: parentNavigatorKey,
          builder: (context, state) {
            return const DetailsVideoView();
          },
        ),
          GoRoute(
            path: AppRoutes.videoPlayerPath,
            parentNavigatorKey: parentNavigatorKey,
            builder: (context, state) {
              return const VideoPlayer();
            },
          ),
          GoRoute(
            path: AppRoutes.lessonPath,
            parentNavigatorKey: parentNavigatorKey,
            builder: (context, state) {
              return const LessonView();
            },
          ),
        ShellRoute(
          builder: (context, state, child) => BottomBar(child: child),
          routes: [
            GoRoute(
              path: AppRoutes.homePath,
              builder: (context, state) => const HomeView(),
            ),
            GoRoute(
              path: AppRoutes.videoPath,
              builder: (context, state) => const VideoView(),
            ),
            GoRoute(
              path: AppRoutes.ratingPath,
              builder: (context, state) => const RatingView(),
            ),
            GoRoute(
              path: AppRoutes.profilePath,
              builder: (context, state) => const ProfileView(),
            ),
          ],
        ),
      ],
    );
  }

  static String _getInitialRoute() {
    bool isOnboardingShown = SharedPrefsHelper.getOnboardingShown();
    String? token = SharedPrefsHelper.getToken();

    if (!isOnboardingShown) {
      return AppRoutes.onBoardingPath;
    } else if (token == null || token.isEmpty) {
      return AppRoutes.registrationPath;
    } else {
      return AppRoutes.homePath;
    }
  }
}
