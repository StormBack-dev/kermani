import 'package:kermani/features/profile/domain/entities/profile_social_media.dart';

abstract class IProfileData {
  IProfileData(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.countryId,
      this.gender,
      this.birthDate,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.mobile,
      this.callNumber,
      this.address,
      this.socialMedia,
      this.isBehandam3User,
      this.hasFitaminService,
      this.media,
      this.remainingCallNum,
      this.hasCall});
  final num? id;
  final num? userId;
  final String? firstName;
  final String? lastName;
  final dynamic email;
  final num? countryId;
  final num? gender;
  final String? birthDate;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final String? mobile;
  final dynamic callNumber;
  final dynamic address;
  final List<IProfileSocialMedia>? socialMedia;
  final bool? isBehandam3User;
  final bool? hasFitaminService;
  final dynamic media;
  final num? remainingCallNum;
  final bool? hasCall;
}
