/// General result
class DataResult<T> {
  /// Weather the request is successful or not.
  final bool isSuccess;

  /// Data in the response.
  final T? data;

  /// Status code of response.
  final int? statusCode;

  /// Additional message to be shown on different occurrences
  ///
  /// Like when the request is failed or successful
  final String? message;

  /// The thrown exception when the request is failed.
  ///
  /// It would be null if the request is successful.
  final Exception? exception;

  /// Default constructor of [DataResult].
  DataResult.fromData({
    required this.isSuccess,
    this.data,
    this.statusCode,
    this.message,
  }) : exception = null;

  /// Constructor when data is successfully retrieved.
  DataResult.fromSuccessData(this.data)
      : isSuccess = true,
        statusCode = 200,
        message = '',
        exception = null;

  /// Constructor when there is an error when receiving data.
  DataResult.fromError(this.exception)
      : isSuccess = false,
        data = null,
        statusCode = 0,
        message = '';
}
