import 'package:dio/dio.dart';
import 'package:pdd_flutter_new_24_04_25/models/profile/DeleteModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/profile/ProfileModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/rank/RankModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/CategoryModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/VideoModel.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../models/profile/ChangeNameModel.dart';
import '../../models/registration/RegistrationModel.dart';
import '../../models/registration/UserModel.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class PddApiClient {
  factory PddApiClient(Dio dio, {String baseUrl}) = _PddApiClient;

  @POST('api/v1/registration/')
  Future<RegistrationModel> getUser(@Body() UserModel username);

  @GET('api/v1/profile')
  Future<ProfileModel> getUserInfo();

  @DELETE('api/v1/profile')
  Future<DeleteModel> getDeleteUserAccount();

  @PATCH('/api/v1/profile/')
  Future<String> changeUserName(
    @Body() ChangeNameModel model,
  );

  @GET('api/v1/top-ratings/')
  Future<List<RankModel>> getRankUsers();

  @GET("/api/v1/categories/")
  Future<List<CategoryModel>> getVideo();

  @GET("/api/v1/subcategories/{id}/videos")
  Future<List<VideoModel>> getAllVideo(@Path('id') int subcategoryId);
}