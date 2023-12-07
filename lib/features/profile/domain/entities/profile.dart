import 'package:kermani/core/data/model/error.dart';
import 'package:kermani/features/profile/domain/entities/profile_data.dart';

abstract class IProfile {
  IProfile({
    this.data,
    this.message,
    this.next,
    this.error,
  });
  IProfileData? data;
  dynamic message;
  String? next;
  ErrorApi? error;
}
