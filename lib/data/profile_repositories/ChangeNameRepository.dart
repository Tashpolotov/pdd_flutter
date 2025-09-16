
import 'package:pdd_flutter_new_24_04_25/models/profile/ChangeNameModel.dart';

import '../../services/pdd_api/api.dart';

class ChangeNameRepository {
  final PddApiClient apiClient;

  ChangeNameRepository({required this.apiClient});

  Future<String> getChangeNameUser(String newName) async {
    try {
      return await apiClient.changeUserName(ChangeNameModel(changeName: newName));
    } catch (e) {
      rethrow;
    }
  }
}
