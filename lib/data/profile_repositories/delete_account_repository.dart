
import 'package:pdd_flutter_new_24_04_25/models/profile/DeleteModel.dart';
import 'package:pdd_flutter_new_24_04_25/services/pdd_api/api.dart';

class DeleteAccountRepository {
  final PddApiClient apiClient;

  DeleteAccountRepository({required this.apiClient});

  Future<DeleteModel> getDeleteUserAccount() async {
    return await apiClient.getDeleteUserAccount();
  }
}


