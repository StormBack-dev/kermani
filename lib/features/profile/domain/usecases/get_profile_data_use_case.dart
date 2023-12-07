import 'package:kermani/core/data/model/data_result.dart';
import 'package:kermani/features/profile/domain/entities/profile.dart';
import 'package:kermani/features/profile/domain/repository/profile_repository.dart';

class GetProfileDataUseCase {
  final IProfileRepository repository;

  GetProfileDataUseCase(this.repository);

  Future<DataResult<IProfile>> call() async {
    return await repository.getProfile();
  }
}
