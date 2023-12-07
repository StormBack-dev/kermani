import 'package:kermani/core/data/model/data_result.dart';
import 'package:kermani/features/profile/domain/entities/profile.dart';
import 'package:kermani/features/profile/domain/entities/profile_social_media.dart';

abstract class IProfileRepository {
  Future<DataResult<IProfile>> getProfile();
  Future<DataResult<List<IProfileSocialMedia>>> getProfileSocialMedia();
  Future<DataResult<List<IProfileSocialMedia>>> addProfileSocialMedia();
  Future<DataResult<List<IProfileSocialMedia>>> updateProfileSocialMedia();
  Future<DataResult<List<IProfileSocialMedia>>> deleteProfileSocialMedia();
}
