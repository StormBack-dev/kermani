import 'package:kermani/core/data/model/data_result.dart';
import 'package:kermani/core/data/provider/kermani_dio_helper.dart';
import 'package:kermani/core/utils/logger.dart';
import 'package:kermani/features/profile/data/models/remote/remote_profile.dart';
import 'package:kermani/features/profile/domain/entities/profile.dart';
import 'package:kermani/features/profile/domain/entities/profile_social_media.dart';
import 'package:kermani/features/profile/domain/repository/profile_repository.dart';

class RemoteProfileRepository extends IProfileRepository {
  @override
  Future<DataResult<IProfile>> getProfile() async {
    try {
      final result = await KermaniDioHelper().getDio().get('profile');
      return DataResult.fromSuccessData(RemoteProfile.fromJson(result.data));
    } on Exception catch (e) {
      logger.e(e.toString());
      return DataResult.fromError(e);
    } catch (e) {
      logger.e(e.toString());
      return DataResult.fromError(Exception(e.toString()));
    }
  }

  @override
  Future<DataResult<List<IProfileSocialMedia>>> addProfileSocialMedia() {
    // TODO: implement addProfileSocialMedia
    throw UnimplementedError();
  }

  @override
  Future<DataResult<List<IProfileSocialMedia>>> deleteProfileSocialMedia() {
    // TODO: implement deleteProfileSocialMedia
    throw UnimplementedError();
  }

  @override
  Future<DataResult<List<IProfileSocialMedia>>> getProfileSocialMedia() {
    // TODO: implement getProfileSocialMedia
    throw UnimplementedError();
  }

  @override
  Future<DataResult<List<IProfileSocialMedia>>> updateProfileSocialMedia() {
    // TODO: implement updateProfileSocialMedia
    throw UnimplementedError();
  }
}
