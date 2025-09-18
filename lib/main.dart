import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:pdd_flutter_new_24_04_25/App.dart';
import 'package:pdd_flutter_new_24_04_25/config/SharedPrefsHelper.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_rank_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_user_profile_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_user_usecase.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_video_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_video_all_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_level_use_case.dart';
import 'config/AppRoutes.dart';
import 'di/app_component.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  AppRoutesHelper.instance;
  await configureDependencies();
  runApp(const AppWithProviders());
}

class AppWithProviders extends StatelessWidget {
  const AppWithProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GetRankUseCase>(
          create: (_) => GetIt.instance<GetRankUseCase>(),
        ),
        Provider<GetUserProfileUseCase>(
          create: (_) => GetIt.instance<GetUserProfileUseCase>(),
        ),
        Provider<GetUserUseCase>(
          create: (_) => GetIt.instance<GetUserUseCase>(),
        ),
        Provider<GetVideoUseCase>(
          create: (_) => GetIt.instance<GetVideoUseCase>(),
        ),
        Provider<GetVideoAllUseCase>(
          create: (_) => GetIt.instance<GetVideoAllUseCase>(),
        ),
        Provider<GetLevelUseCase>(
          create: (_) => GetIt.instance<GetLevelUseCase>(),
        ),
      ],
      child: const App(),
    );
  }
}
