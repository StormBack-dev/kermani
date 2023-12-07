import 'package:kermani/features/profile/domain/entities/profile_pivot.dart';

class RemoteProfilePivot extends IProfilePivot {
  RemoteProfilePivot({
    super.userId,
    super.socialMediaId,
    super.link,
  });

  factory RemoteProfilePivot.fromJson(Map<String, dynamic> json) {
    return RemoteProfilePivot(
      userId: json['user_id'],
      socialMediaId: json['social_media_id'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['social_media_id'] = socialMediaId;
    map['link'] = link;
    return map;
  }

  static List<RemoteProfilePivot> fromJsonList(List<dynamic> json) {
    return List.from(json.map((e) => RemoteProfilePivot.fromJson(e as Map<String, dynamic>)));
  }
}
