import 'package:kermani/features/profile/data/models/remote/remote_profile_social_media.dart';
import 'package:kermani/features/profile/domain/entities/profile_data.dart';

class RemoteProfileData extends IProfileData {
  RemoteProfileData(
      {super.id,
      super.userId,
      super.firstName,
      super.lastName,
      super.email,
      super.countryId,
      super.gender,
      super.birthDate,
      super.createdAt,
      super.updatedAt,
      super.deletedAt,
      super.mobile,
      super.callNumber,
      super.address,
      super.socialMedia,
      super.isBehandam3User,
      super.hasFitaminService,
      super.media,
      super.remainingCallNum,
      super.hasCall});

  factory RemoteProfileData.fromJson(Map<String, dynamic> json) {
    return RemoteProfileData(
      id: json['id'],
      userId: json['user_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      countryId: json['country_id'],
      gender: json['gender'],
      birthDate: json['birth_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      mobile: json['mobile'],
      callNumber: json['call_number'],
      address: json['address'],
      socialMedia:
          json['social_media'] != null ? RemoteProfileSocialMedia.fromJsonList(json['social_media'] as List) : null,
      isBehandam3User: json['is_behandam3_user'],
      hasFitaminService: json['has_fitamin_service'],
      media: json['media'],
      remainingCallNum: json['remaining_call_num'],
      hasCall: json['has_call'],
    );
  }

  static List<RemoteProfileData> fromJsonList(List<dynamic> json) {
    return List.from(json.map((e) => RemoteProfileData.fromJson(e as Map<String, dynamic>)));
  }
}
