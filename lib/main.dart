import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:pdd_flutter_new_24_04_25/App.dart';
import 'package:pdd_flutter_new_24_04_25/config/SharedPrefsHelper.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_rank_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_user_profile_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_user_usecase.dart';
import 'config/AppRoutes.dart';
import 'di/app_component.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  AppRoutesHelper.instance;
  await configureDependencies();
  runApp(const AppWithProviders());
}

/// Оборачиваем App в провайдеры для правильного DI
class AppWithProviders extends StatelessWidget {
  const AppWithProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Провайдеры для UseCase'ов из GetIt
        Provider<GetRankUseCase>(
          create: (_) => GetIt.instance<GetRankUseCase>(),
        ),
        Provider<GetUserProfileUseCase>(
          create: (_) => GetIt.instance<GetUserProfileUseCase>(),
        ),
        Provider<GetUserUseCase>(
          create: (_) => GetIt.instance<GetUserUseCase>(),
        ),
      ],
      child: const App(),
    );
  }
}
