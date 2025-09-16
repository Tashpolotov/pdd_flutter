import 'package:pdd_flutter_new_24_04_25/data/profile_repositories/ChangeNameRepository.dart';
import 'package:pdd_flutter_new_24_04_25/data/profile_repositories/delete_account_repository.dart';
import 'package:pdd_flutter_new_24_04_25/data/profile_repositories/profile_repository.dart';
import 'package:pdd_flutter_new_24_04_25/models/profile/DeleteModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/profile/ProfileModel.dart';

class GetUserProfileUseCase {
  final ProfileRepository repository;
  final DeleteAccountRepository deleteAccountRepository;
  final ChangeNameRepository changeNameRepository;
  GetUserProfileUseCase(this.repository, this.deleteAccountRepository, this.changeNameRepository);

  Future<ProfileModel> execute() async {
      return await repository.getUserInfo();
  }
  Future<DeleteModel> executeDelete() async {
    return await deleteAccountRepository.getDeleteUserAccount();
  }
  Future<String> executeChangeName(String newName) async {
    return await changeNameRepository.getChangeNameUser(newName);
  }
}
