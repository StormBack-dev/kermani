import 'package:kermani/features/profile/domain/entities/profile_pivot.dart';

abstract class IProfileSocialMedia {
  IProfileSocialMedia({
    this.id,
    this.name,
    this.pivot,
  });
  num? id;
  String? name;
  IProfilePivot? pivot;
}
