import 'package:kermani/core/domain/entity/remote_error.dart';
import 'package:kermani/features/profile/data/models/remote/remote_profile_data.dart';
import 'package:kermani/features/profile/domain/entities/profile.dart';

class RemoteProfile extends IProfile {
  RemoteProfile({
    super.data,
    super.message,
    super.next,
    super.error,
  });

  factory RemoteProfile.fromJson(Map<String, dynamic> json) {
    return RemoteProfile(
      data: json['data'] != null ? RemoteProfileData.fromJson(json['data'] as Map<String, dynamic>) : null,
      message: json['message'],
      next: json['next'],
      error: json['error'] != null ? RemoteError.fromJson(json['error'] as Map<String, dynamic>) : null,
    );
  }


  static List<RemoteProfile> fromJsonList(List<dynamic> json) {
    return List.from(json.map((e) => RemoteProfile.fromJson(e as Map<String, dynamic>)));
  }
}
