import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'package:pdd_flutter_new_24_04_25/config/SharedPrefsHelper.dart';
import 'package:pdd_flutter_new_24_04_25/data/profile_repositories/ChangeNameRepository.dart';
import 'package:pdd_flutter_new_24_04_25/data/profile_repositories/delete_account_repository.dart';
import 'package:pdd_flutter_new_24_04_25/data/profile_repositories/profile_repository.dart';
import 'package:pdd_flutter_new_24_04_25/data/rank/rank_repository.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_rank_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_user_profile_use_case.dart';

import '../config/constans.dart';
import '../data/registration_repositories/repository.dart';
import '../domain/get_user_usecase.dart';
import '../services/pdd_api/api.dart';

final getIt = GetIt.instance;

///  Глобальный логгер
final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

///  Основная точка конфигурации зависимостей
Future<void> configureDependencies() async {
  _configureNetworkDependencies();
  _configureApiClients();
  _configureRepositories();
  _configureUseCases();
}

///  Сетевой слой + логгирование Dio
void _configureNetworkDependencies() {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.pddUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {"Accept": "application/json"},
    ),
  );

  //  Добавляем токен, если требуется
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await SharedPrefsHelper.getToken();
        final noAuthPaths = ["api/v1/registration/"];
        final needAuth =
            !noAuthPaths.any((path) => options.path.contains(path));

        if (needAuth && token != null && token.isNotEmpty) {
          options.headers["Authorization"] = "JWT $token";
        }

        return handler.next(options);
      },
    ),
  );

  //  Добавляем фильтрованный логгер
  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestBody: true,     //  не логировать тело запроса
      requestHeader: false,   //  не логировать заголовки запроса
      responseBody: true,    //  не логировать тело ответа
      responseHeader: false,  //  не логировать заголовки ответа
      error: true,            //  логировать ошибки
      logPrint: (log) {
        final logStr = log.toString();

        //  Убираем "мусорные" строки
        final blacklist = [
          'responseType',
          'followRedirects',
          'persistentConnection',
          'connectTimeout',
          'sendTimeout',
          'receiveTimeout',
          'receiveDataWhenStatusError',
          'extra: {}',
        ];

        final shouldSkip = blacklist.any((entry) => logStr.contains(entry));
        if (!shouldSkip) {
          logger.i('okhttp $logStr');
        }
      },
    ),
  );

  getIt.registerSingleton<Dio>(dio);
}

///  Api-клиент
void _configureApiClients() {
  final dio = getIt.get<Dio>();
  getIt.registerLazySingleton<PddApiClient>(() => PddApiClient(dio));
}

///  Репозитории
void _configureRepositories() {
  final PddApiClient pddApiClient = getIt.get<PddApiClient>();

  getIt
    ..registerLazySingleton<RegistrationRepository>(
      () => RegistrationRepository(apiClient: pddApiClient),
    )
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepository(apiClient: pddApiClient),
    )
    ..registerLazySingleton<DeleteAccountRepository>(
      () => DeleteAccountRepository(apiClient: pddApiClient),
    )
    ..registerLazySingleton<ChangeNameRepository>(
      () => ChangeNameRepository(apiClient: pddApiClient),
    )
  ..registerLazySingleton<RankRepository>(
      () => RankRepository(apiClient: pddApiClient)
  );
}

/// ⚙ UseCase-слой
void _configureUseCases() {
  final RegistrationRepository registrationRepository =
      getIt.get<RegistrationRepository>();
  final ProfileRepository profileRepository = getIt.get<ProfileRepository>();
  final DeleteAccountRepository deleteAccountRepository =
      getIt.get<DeleteAccountRepository>();
  final ChangeNameRepository changeNameRepository =
      getIt.get<ChangeNameRepository>();
  final RankRepository rankRepository =
      getIt.get<RankRepository>();

  getIt
    ..registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCase(registrationRepository),
    )
    ..registerLazySingleton<GetUserProfileUseCase>(
      () => GetUserProfileUseCase(
        profileRepository,
        deleteAccountRepository,
        changeNameRepository,
      ),
    )
    ..registerLazySingleton<GetRankUseCase>(
      () => GetRankUseCase(rankRepository),
    );
}
