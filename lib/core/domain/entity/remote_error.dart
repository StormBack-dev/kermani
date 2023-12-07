import 'package:kermani/core/data/model/error.dart';

class RemoteError extends ErrorApi {
  RemoteError({super.message, super.errors});

  factory RemoteError.fromJson(Map<String, dynamic> json) {
    return RemoteError(
      message: json['message'],
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errors': errors,
    };
  }

  static List<RemoteError> fromJsonList(List<dynamic> json) {
    return List.from(json.map((e) => RemoteError.fromJson(e as Map<String, dynamic>)));
  }
}
