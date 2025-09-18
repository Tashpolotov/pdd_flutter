import 'package:dio/dio.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/lesson/ListLessonModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/profile/DeleteModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/profile/ProfileModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/rank/RankModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/CategoryModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/VideoModel.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../models/main/level/LessonModel.dart';
import '../../models/profile/ChangeNameModel.dart';
import '../../models/registration/RegistrationModel.dart';
import '../../models/registration/UserModel.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class PddApiClient {
  factory PddApiClient(Dio dio, {String baseUrl}) = _PddApiClient;

  static const String baseApi = "/api/v1/";

  @POST('${baseApi}registration')
  Future<RegistrationModel> getUser(@Body() UserModel username);

  @GET('${baseApi}profile')
  Future<ProfileModel> getUserInfo();

  @DELETE('${baseApi}profile')
  Future<DeleteModel> getDeleteUserAccount();

  @PATCH('${baseApi}profile')
  Future<String> changeUserName(@Body() ChangeNameModel model);

  @GET('${baseApi}top-ratings')
  Future<List<RankModel>> getRankUsers();

  @GET('${baseApi}categories')
  Future<List<CategoryModel>> getVideo();

  @GET('${baseApi}subcategories/{id}/videos')
  Future<List<VideoModel>> getAllVideo(@Path('id') int subcategoryId);

  @GET('${baseApi}level')
  Future<List<LessonModel>> getAllLevelCard();

  @GET("${baseApi}level/{level_pk}/lessons/")
  Future<List<ListLessonModel>> getListLesson(@Path('level_pk') int levelId);

}
