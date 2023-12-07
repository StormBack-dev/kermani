import 'package:kermani/features/profile/data/models/remote/remote_profile_pivot.dart';
import 'package:kermani/features/profile/domain/entities/profile_social_media.dart';

class RemoteProfileSocialMedia extends IProfileSocialMedia {
  RemoteProfileSocialMedia({
    super.id,
    super.name,
    super.pivot,
  });

  factory RemoteProfileSocialMedia.fromJson(Map<String, dynamic> json) {
    return RemoteProfileSocialMedia(
      id: json['id'],
      name: json['name'],
      pivot: json['pivot'] != null ? RemoteProfilePivot.fromJson(json['pivot'] as Map<String, dynamic>) : null,
    );
  }

  static List<RemoteProfileSocialMedia> fromJsonList(List<dynamic> json) {
    return List.from(json.map((e) => RemoteProfileSocialMedia.fromJson(e as Map<String, dynamic>)));
  }
}
