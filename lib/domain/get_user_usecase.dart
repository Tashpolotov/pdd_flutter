import '../data/registration_repositories/repository.dart';
import '../models/registration/RegistrationModel.dart';


class GetUserUseCase {
  final RegistrationRepository repository;

  GetUserUseCase(this.repository);

  Future<RegistrationModel> execute(String username) async {
    try {
      final response = await repository.getUser(username);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}